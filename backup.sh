#!/bin/bash

echo "Creating DB backup"
/usr/bin/sqlite3 $SQLITE_DB -line '.backup /backup/backup.db'
echo "Backup with Borg"

ARCHIVE_NAME=$(date +%Y_%m_%d-%H:%M)
/bin/borg create ::$ARCHIVE_NAME /backup

/bin/borg info ::$ARCHIVE_NAME