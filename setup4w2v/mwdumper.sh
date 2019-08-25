#!/bin/bash
set -eo pipefail

DUMP_FILE=$1
FILTER_FILE=$2
OUT_FILE=$3

if [ -z "$MWDUMPER_PATH" ]; then
  printf "mwdumper location not known. Specify location in MWDUMPER_PATH env variable. Aborting.\n"
  exit 1
fi

if [ ! -f "$DUMP_FILE" ]; then
  printf "Wikimedia dump file not provided. Aborting.\n"
  exit 1
fi

if [ ! -f "$FILTER_FILE" ]; then
  printf "Filter file not provided. Aborting.\n"
  exit 1
fi

if [ -z "$OUT_FILE" ]; then
  printf "Output filename not provided. Aborting.\n"
  exit 1
fi

bzcat "$DUMP_FILE" | java -Xmx512m -Xms128m -XX:NewSize=32m -XX:MaxNewSize=64m -XX:SurvivorRatio=6 -XX:+UseParallelGC -XX:GCTimeRatio=9 -XX:AdaptiveSizeDecrementScaleFactor=1 -server -jar "$MWDUMPER_PATH"/target/mwdumper-1.25.jar --format=xml --filter=exactlist:"$FILTER_FILE" --filter=latest --filter=notalk | bzip2 > "${OUT_FILE}.bz2"
