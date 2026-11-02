#!/bin/bash
# This program downloads the first mp3 from an Ivoox rss that has a duration
# higher to the defined as parameter in the format hhmmss

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

declare -a durations
durations=(`cat "$RSS_FILE_PATH" | grep -o '<itunes:duration>[^<]*' | grep -o '[^>]*$' | sed s/\://g| sed s/^0*//g`)
declare -a episodes
episodes=(`cat "$RSS_FILE_PATH" | grep -o '<enclosure[^>]*url="[^"]*' | grep -o '[^"]*$'`)
declare -a titles
titles=(`cat "$RSS_FILE_PATH" | grep -o '<itunes:title>[^<]*' | grep -o '[^>]*$'| tr -d ' '`)

rm -f "$RSS_FILE_PATH"

POS=0
if [ $EPISODE_MIN_DURATION == 0 ]; then
    if [ -z $FILTER ]; then
	SELECTED_DOWNLOAD=${episodes[0]};
    else
    for i in "${episodes[@]}"; do
	if [[ $i == *"$FILTER"* ]]; then
	    SELECTED_DOWNLOAD=$i;
	    break;
	fi
	if [[ ${titles[$POS]} == *"$FILTER"* ]]; then
            SELECTED_DOWNLOAD=${episodes[$POS]};
            break;
        fi
       ((POS++))
    done
    fi
else
for i in "${durations[@]}"; do
  if test $i -ge $EPISODE_MIN_DURATION; then 
    if [ -z $FILTER ]; then
	SELECTED_DOWNLOAD=${episodes[$POS]};
	break;
    else
	if [[ ${episodes[$POS]} == *"$FILTER"* ]]; then
 	    SELECTED_DOWNLOAD=${episodes[$POS]};
            break;
        fi
	if [[ ${titles[$POS]} == *"$FILTER"* ]]; then
           SELECTED_DOWNLOAD=${episodes[$POS]};
            break;
        fi
    fi
  fi
  ((POS++))
done
fi

if [ -z "$SELECTED_DOWNLOAD" ]; then
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

EXTENSION_RSS=`echo "$SELECTED_DOWNLOAD" | sed "s/.*\.//g"`
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
    echo "`$DATE_CMD` - [$TARGET_FILENAME][INFO] Downloaded selected episode $SELECTED_DOWNLOAD with $i duration"
    # wget -q -O "$TARGET_DOWNLOAD_PATH" "$SELECTED_DOWNLOAD"   
    curl -s -L -o "$TARGET_DOWNLOAD_PATH" "$SELECTED_DOWNLOAD"
    echo "$SELECTED_DOWNLOAD" > "$TARGET_PATH.lastdownload.txt"
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
else
  echo "`$DATE_CMD` - [$TARGET_FILENAME][INFO] No new episodes"
fi

