#!/bin/bash
# This program downloads the first mp3 from an Ivoox rss that has a duration
# higher to the defined as parameter in the format hhmmss
#
# Previews: some iVoox episodes (fan-only content) are served as a short
# preview (~10-15 min) while the RSS announces the full duration. After the
# download the real duration (ffprobe) is compared with the announced one: if
# it is shorter than PREVIEW_RATIO percent, the file is rejected, remembered for
# REJECT_TTL_MIN minutes and the next candidate episode is tried. The episode
# already in place is never overwritten by a preview.

PODCAST_RSS_URL="$1"
TARGET_PATH="$2"
EPISODE_MIN_DURATION=$3
FILTER="$4"

TARGET_FILENAME=$( basename "$TARGET_PATH" )
TARGET_DIR=$( dirname "$TARGET_PATH" )
RSS_FILE_PATH=/var/tmp/$TARGET_FILENAME.rss

DATE_CMD="date --rfc-3339=seconds"
DATE_URL=`date +%s`

if [[ $PODCAST_RSS_URL =~ .*mixcloud.com.* ]]; then
    # Downloading RSS from mixcloud
    /home/cuacfm/bin/download-mixcloud.php "$PODCAST_RSS_URL" > $RSS_FILE_PATH
    MIXCLOUD=1
else
    # Downloading RSS
    curl -s -L -o "$RSS_FILE_PATH" "$PODCAST_RSS_URL?$DATE_URL"
fi

if [ $? != 0 ]; then
    echo "`$DATE_CMD` - [$TARGET_FILENAME][ERROR] Not available RSS URL $PODCAST_RSS_URL"
    exit 1
fi

if [[ $PODCAST_RSS_URL =~ .*ivoox.com.* ]]; then
    # We sleep for 1 seconds between request
    sleep 1
fi


PREVIEW_RATIO=60          # % of the announced duration below which it is a preview
REJECT_TTL_MIN=1440       # do not download a rejected episode again for a day
MAX_TRIES=3               # candidate episodes to try in each run
CACHE_DIR="${XDG_CACHE_HOME:-$HOME/.cache}/descarga-podcasts/rejected"
mkdir -p "$CACHE_DIR"

# "1:02:03", "62:03" or "3723" -> seconds (0 if unknown)
to_seconds() {
    local d="$1" h=0 m=0 s=0
    IFS=: read -r a b c <<< "$d"
    if [ -n "$c" ]; then h=$a; m=$b; s=$c
    elif [ -n "$b" ]; then m=$a; s=$b
    else s=$a; fi
    [[ "$h$m$s" =~ ^[0-9]+$ ]] || { echo 0; return; }
    echo $(( 10#$h * 3600 + 10#$m * 60 + 10#$s ))
}

declare -a durations
durations=(`cat "$RSS_FILE_PATH" | grep -o '<itunes:duration>[^<]*' | grep -o '[^>]*$' | sed s/\://g| sed s/^0*//g`)
declare -a durations_raw
durations_raw=(`cat "$RSS_FILE_PATH" | grep -o '<itunes:duration>[^<]*' | grep -o '[^>]*$'`)
declare -a episodes
episodes=(`cat "$RSS_FILE_PATH" | grep -o '<enclosure[^>]*url="[^"]*' | grep -o '[^"]*$'`)
declare -a titles
titles=(`cat "$RSS_FILE_PATH" | grep -o '<itunes:title>[^<]*' | grep -o '[^>]*$'| tr -d ' '`)

rm -f "$RSS_FILE_PATH"

# Candidate positions, in feed order, with the same rules as before
declare -a candidates
POS=0
if [ $EPISODE_MIN_DURATION == 0 ]; then
    for i in "${episodes[@]}"; do
        if [ -z "$FILTER" ] || [[ $i == *"$FILTER"* ]] || [[ ${titles[$POS]} == *"$FILTER"* ]]; then
            candidates+=($POS)
        fi
        ((POS++))
    done
else
    for i in "${durations[@]}"; do
        if test $i -ge $EPISODE_MIN_DURATION; then
            if [ -z "$FILTER" ] || [[ ${episodes[$POS]} == *"$FILTER"* ]] || [[ ${titles[$POS]} == *"$FILTER"* ]]; then
                candidates+=($POS)
            fi
        fi
        ((POS++))
    done
fi

if [ ${#candidates[@]} == 0 ]; then
  echo "`$DATE_CMD` - [$TARGET_FILENAME][ERROR] No episodes available"
  exit 1
fi

if [ ! -d "$TARGET_DIR" ]; then
    echo "Creando ruta $TARGET_DIR no existente"
    mkdir -p "$TARGET_DIR"
fi

if [ -f "$TARGET_PATH" ] && [ -f "$TARGET_PATH.lastdownload.txt" ]
  then
      LAST_DOWNLOAD="`cat \"$TARGET_PATH.lastdownload.txt\"`"
fi

same_episode() {
    if [ "$MIXCLOUD" == 1 ]; then
        [ "`echo "$1" | sed "s+.*/++g"`" == "`echo "$2" | sed "s+.*/++g"`" ]
    else
        [ "$1" == "$2" ]
    fi
}

EXTENSION_TARGET=`echo "$TARGET_PATH" | sed "s/.*\.//g"`
TRIES=0
for POS in "${candidates[@]}"; do
    SELECTED_DOWNLOAD=${episodes[$POS]}
    if same_episode "$SELECTED_DOWNLOAD" "$LAST_DOWNLOAD"; then
        echo "`$DATE_CMD` - [$TARGET_FILENAME][INFO] No new episodes"
        exit 0
    fi
    # Only the newest MAX_TRIES candidates are considered, also those
    # rejected recently: older episodes are never walked through
    ((TRIES++))
    if [ $TRIES -gt $MAX_TRIES ]; then
        break
    fi
    REJECT_MARK="$CACHE_DIR/`echo "${SELECTED_DOWNLOAD%%\?*}" | md5sum | cut -d' ' -f1`"
    if [ -n "`find "$REJECT_MARK" -mmin -$REJECT_TTL_MIN 2>/dev/null`" ]; then
        continue   # preview rejected recently
    fi

    # Extension without the query string (iVoox adds "?d=...")
    EXTENSION_RSS=`echo "${SELECTED_DOWNLOAD%%\?*}" | sed "s/.*\.//g"`
    TMP_DIR=`mktemp -d /var/tmp/descarga-podcast.XXXXXX`
    TMP_DOWNLOAD="$TMP_DIR/episode.$EXTENSION_RSS"
    TMP_TARGET="$TMP_DIR/episode.$EXTENSION_TARGET"

    curl -s -L -o "$TMP_DOWNLOAD" "$SELECTED_DOWNLOAD"
    if [ $? != 0 ] || [ ! -s "$TMP_DOWNLOAD" ]; then
        echo "`$DATE_CMD` - [$TARGET_FILENAME][ERROR] Download failed $SELECTED_DOWNLOAD"
        rm -rf "$TMP_DIR"
        continue
    fi

    EXPECTED=`to_seconds "${durations_raw[$POS]}"`
    REAL=`ffprobe -v error -show_entries format=duration -of csv=p=0 "$TMP_DOWNLOAD" 2>/dev/null | cut -d. -f1`
    if [ "$EXPECTED" -gt 0 ] && [ -n "$REAL" ] && [ $(( REAL * 100 )) -lt $(( EXPECTED * PREVIEW_RATIO )) ]; then
        echo "`$DATE_CMD` - [$TARGET_FILENAME][ERROR] Preview rejected: $SELECTED_DOWNLOAD lasts ${REAL}s, RSS says ${EXPECTED}s"
        touch "$REJECT_MARK"
        rm -rf "$TMP_DIR"
        continue
    fi

    echo "`$DATE_CMD` - [$TARGET_FILENAME][INFO] Downloaded selected episode $SELECTED_DOWNLOAD with ${durations[$POS]} duration"
    if [ "$EXTENSION_RSS" != "$EXTENSION_TARGET" ]; then
       echo "`$DATE_CMD` - [$TARGET_FILENAME][INFO] Convirtiendo $SELECTED_DOWNLOAD de $EXTENSION_RSS a $EXTENSION_TARGET"
       ffmpeg -loglevel panic -y -i "$TMP_DOWNLOAD" "$TMP_TARGET"
       rm -f "$TMP_DOWNLOAD"
    fi
    FORMAT_NOT_MP3=`file -b "$TMP_TARGET" |grep -v "MPEG.*layer III"`
    if [ "$EXTENSION_TARGET" = "mp3" ] && [ ! -z "$FORMAT_NOT_MP3" ]; then
	echo "`$DATE_CMD` - [$TARGET_FILENAME][INFO] Formato no identificado como MP3 es $FORMAT_NOT_MP3"
	echo "`$DATE_CMD` - [$TARGET_FILENAME][INFO] Convirtiendo $SELECTED_DOWNLOAD a $EXTENSION_TARGET"
	mv -f "$TMP_TARGET" "$TMP_TARGET".tmp
	ffmpeg -loglevel panic -y -i "$TMP_TARGET".tmp "$TMP_TARGET"
	rm -f "$TMP_TARGET".tmp
    fi
    mv -f "$TMP_TARGET" "$TARGET_PATH"
    echo "$SELECTED_DOWNLOAD" > "$TARGET_PATH.lastdownload.txt"
    rm -rf "$TMP_DIR"
    exit 0
done

echo "`$DATE_CMD` - [$TARGET_FILENAME][WARNING] No new full episode (previews or failed downloads); keeping the current file"
