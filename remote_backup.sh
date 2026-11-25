#!/usr/bin/env bash
set -euo pipefail

SRC=$HOME/my_project/
DST=local-arch:$HOME/backups/my_project/
LOG=$HOME/backup.log

rsync -av --delete -e 'ssh -o BatchMode=yes -o ConnectTimeout=5' $SRC $DST >> $LOG 2>&1
date '+%T Backup OK' >> $LOG
