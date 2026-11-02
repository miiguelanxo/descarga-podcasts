#!/bin/bash
# This program downloads the first mp3 from an Ivoox rss that has a duration
# higher to the defined as parameter in the format hhmmss
# Optional: FILTER selects episodes whose URL or title contains it,
# EXCLUDE skips episodes whose title contains it

PODCAST_RSS_URL="$1"
TARGET_PATH="$2"
EPISODE_MIN_DURATION=$3
FILTER="$4"
EXCLUDE="$5"

TARGET_FILENAME=$( basename "$TARGET_PATH" )
TARGET_DIR=$( dirname "$TARGET_PATH" )
RSS_FILE_PATH=/var/tmp/$TARGET_FILENAME.rss

DATE_CMD="date --rfc-3339=seconds"
DATE_URL=`date +%s`

CURL_OPTS=(-s -L --fail --connect-timeout 30 --speed-limit 1000 --speed-time 120)

if [[ $PODCAST_RSS_URL =~ .*mixcloud.com.* ]]; then
    # Downloading RSS from mixcloud
    /home/cuacfm/bin/download-mixcloud.php "$PODCAST_RSS_URL" > $RSS_FILE_PATH
    MIXCLOUD=1
else
    # Downloading RSS
    curl "${CURL_OPTS[@]}" --max-time 120 -o "$RSS_FILE_PATH" "$PODCAST_RSS_URL?$DATE_URL"
fi

if [ $? != 0 ]; then
    echo "`$DATE_CMD` - [$TARGET_FILENAME][ERROR] Not available RSS URL $PODCAST_RSS_URL"
    rm -f "$RSS_FILE_PATH"
    exit 1
fi

if [[ $PODCAST_RSS_URL =~ .*ivoox.com.* ]]; then
    # We sleep for 1 seconds between request
    sleep 1
fi

# One line per <item>: url, length, duration, title, itunes:title (tab separated)
ITEMS=`awk '
function text(s, t,   v, e) {
    if (!match(s, "<" t "[ >]")) return ""
    s = substr(s, RSTART)
    s = substr(s, index(s, ">") + 1)
    e = index(s, "</" t ">")
    if (!e) return ""
    v = substr(s, 1, e - 1)
    gsub(/<!\[CDATA\[|\]\]>/, "", v)
    gsub(/[\t\r\n]+/, " ", v)
    return v
}
function attr(s, t, n,   v) {
    if (!match(s, "<" t "[^>]*>")) return ""
    v = substr(s, RSTART, RLENGTH)
    if (!match(v, " " n "=\"[^\"]*\"")) return ""
    return substr(v, RSTART + length(n) + 3, RLENGTH - length(n) - 4)
}
BEGIN { RS = "</item>" }
match($0, /<item[ >]/) {
    s = substr($0, RSTART)
    url = attr(s, "enclosure", "url")
    if (url == "") next
    printf "%s\t%s\t%s\t%s\t%s\n", url, attr(s, "enclosure", "length"), text(s, "itunes:duration"), text(s, "title"), text(s, "itunes:title")
}' "$RSS_FILE_PATH"`

rm -f "$RSS_FILE_PATH"

while IFS=$'\t' read -r url length duration title ititle; do
    [ -z "$url" ] && continue
    if [ -n "$EXCLUDE" ] && [[ $title == *"$EXCLUDE"* || $ititle == *"$EXCLUDE"* ]]; then
        continue
    fi
    duration=`echo "${duration//:/}" | sed 's/^0*//'`
    if [ "$EPISODE_MIN_DURATION" != 0 ] && ! [ "${duration:-0}" -ge "$EPISODE_MIN_DURATION" ] 2>/dev/null; then
        continue
    fi
    if [ -n "$FILTER" ] && [[ $url != *"$FILTER"* && $title != *"$FILTER"* && ${ititle// /} != *"$FILTER"* ]]; then
        continue
    fi
    SELECTED_DOWNLOAD=$url
    SELECTED_LENGTH=$length
    i=$duration
    break
done <<< "$ITEMS"

if [ -z "$SELECTED_DOWNLOAD" ]; then
  echo "`$DATE_CMD` - [$TARGET_FILENAME][ERROR] No episodes available"
  exit 1
fi

# The iVoox feed URL serves only a preview on podcasts with Fans; listen_mn serves the whole episode
# and its size matches the enclosure length, so it can be checked (other hosts announce wrong lengths)
DOWNLOAD_URL="$SELECTED_DOWNLOAD"
if [[ $SELECTED_DOWNLOAD =~ ivoox\.com/.*_mf_([0-9]+)_ ]]; then
    DOWNLOAD_URL="https://www.ivoox.com/listen_mn_${BASH_REMATCH[1]}_1.mp3"
    CHECK_LENGTH=1
fi

if [ ! -d "$TARGET_DIR" ]; then
    echo "Creando ruta $TARGET_DIR no existente"
    mkdir -p "$TARGET_DIR"
fi

if [ -f "$TARGET_PATH" ] && [ -f "$TARGET_PATH.lastdownload.txt" ]
  then
      LAST_DOWNLOAD="`cat \"$TARGET_PATH.lastdownload.txt\"`"
fi

EXTENSION_RSS=`echo "${DOWNLOAD_URL%%\?*}" | sed "s/.*\.//g"`
EXTENSION_TARGET=`echo "$TARGET_PATH" | sed "s/.*\.//g"`

TARGET_DOWNLOAD_PATH="$TARGET_PATH"
if [ "$EXTENSION_RSS" != "$EXTENSION_TARGET" ]; then
    TARGET_DOWNLOAD_PATH="$TARGET_PATH.$EXTENSION_RSS"
fi

if [ "$MIXCLOUD" == 1 ]; then
	SELECTED_FILENAME=`echo "$SELECTED_DOWNLOAD" | sed "s+.*/++g"`
	LAST_FILENAME=`echo "$LAST_DOWNLOAD" | sed "s+.*/++g"`
	if [ "$LAST_FILENAME" != "$LAST_FILENAME" ]; then
		NEWEPISODE=1
	fi
else
	if [ "$SELECTED_DOWNLOAD" != "$LAST_DOWNLOAD" ]; then
		NEWEPISODE=1
	fi
fi

if [ "$NEWEPISODE" == 1 ]; then
    PART_PATH="$TARGET_DOWNLOAD_PATH.part"
    if ! curl "${CURL_OPTS[@]}" -o "$PART_PATH" "$DOWNLOAD_URL"; then
        echo "`$DATE_CMD` - [$TARGET_FILENAME][ERROR] Failed download of $DOWNLOAD_URL"
        rm -f "$PART_PATH"
        exit 1
    fi
    DOWNLOADED_SIZE=`stat -c %s "$PART_PATH"`
    if [ "$CHECK_LENGTH" == 1 ] && [[ $SELECTED_LENGTH =~ ^[0-9]+$ ]] && [ "$SELECTED_LENGTH" -gt 1000000 ] && [ $(( DOWNLOADED_SIZE * 10 )) -lt $(( SELECTED_LENGTH * 9 )) ]; then
        echo "`$DATE_CMD` - [$TARGET_FILENAME][ERROR] Incomplete episode $DOWNLOAD_URL: $DOWNLOADED_SIZE of $SELECTED_LENGTH bytes"
        rm -f "$PART_PATH"
        exit 1
    fi
    mv -f "$PART_PATH" "$TARGET_DOWNLOAD_PATH"
    echo "`$DATE_CMD` - [$TARGET_FILENAME][INFO] Downloaded selected episode $SELECTED_DOWNLOAD with $i duration"
    if [ "$CHECK_LENGTH" == 1 ] && [[ $SELECTED_LENGTH =~ ^[0-9]+$ ]] && [ "$SELECTED_LENGTH" -gt 1000000 ] && [ "$DOWNLOADED_SIZE" -gt $(( SELECTED_LENGTH + 100000 )) ]; then
        echo "`$DATE_CMD` - [$TARGET_FILENAME][WARN] $(( DOWNLOADED_SIZE - SELECTED_LENGTH )) bytes more than announced in the RSS, it may contain ads"
    fi
    if [ "$TARGET_DOWNLOAD_PATH" != "$TARGET_PATH" ]; then
       echo "`$DATE_CMD` - [$TARGET_FILENAME][INFO] Convirtiendo $SELECTED_DOWNLOAD de $EXTENSION_RSS a $EXTENSION_TARGET"
       ffmpeg -loglevel panic -y -i "$TARGET_DOWNLOAD_PATH" "$TARGET_PATH"
       rm "$TARGET_DOWNLOAD_PATH"
    fi
    FORMAT_NOT_MP3=`file -b "$TARGET_PATH" |grep -v "MPEG.*layer III"`
    if [ "$EXTENSION_TARGET" = "mp3" ] && [ ! -z "$FORMAT_NOT_MP3" ]; then
	echo "`$DATE_CMD` - [$TARGET_FILENAME][INFO] Formato no identificado como MP3 es $FORMAT_NOT_MP3"
	echo "`$DATE_CMD` - [$TARGET_FILENAME][INFO] Convirtiendo $SELECTED_DOWNLOAD a $EXTENSION_TARGET"
	mv -f "$TARGET_PATH" "$TARGET_PATH".tmp
	ffmpeg -loglevel panic -y -i "$TARGET_PATH".tmp "$TARGET_PATH"
	rm "$TARGET_PATH".tmp
    fi
    echo "$SELECTED_DOWNLOAD" > "$TARGET_PATH.lastdownload.txt"
else
  echo "`$DATE_CMD` - [$TARGET_FILENAME][INFO] No new episodes"
fi
