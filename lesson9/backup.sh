#!/bin/bash
TIMESTAMP=$(date +"%F_%T")
BACKUP_DIR="/opt/mysql_backup"
MYSQL_USER="root"
MYSQL_PASSWORD="password"
DATABASE="mydatabase"

mysqldump -u $MYSQL_USER -p$MYSQL_PASSWORD $DATABASE > $BACKUP_DIR/$DATABASE_$TIMESTAMP.sql
