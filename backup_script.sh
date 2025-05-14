#!/bin/bash

SOURCE_DIR="/path/to/your/data"
DEST_DIR="/mnt/backup/"
LOG_FILE="backup_report.log"
DATE=$(date '+%Y-%m-%d_%H-%M-%S')

mkdir -p "$DEST_DIR"

# Backup using rsync
rsync -av --delete "$SOURCE_DIR" "$DEST_DIR" &> /tmp/rsync_output

if [ $? -eq 0 ]; then
  echo "[$DATE] Backup SUCCESSFUL" >> $LOG_FILE
else
  echo "[$DATE] Backup FAILED" >> $LOG_FILE
  cat /tmp/rsync_output >> $LOG_FILE
fi

rm /tmp/rsync_output
