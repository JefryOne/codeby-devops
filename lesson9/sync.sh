#!/bin/bash
rsync -avz /opt/mysql_backup/ grom@192.168.0.112:/opt/store/mysql
