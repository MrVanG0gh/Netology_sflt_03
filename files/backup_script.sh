#!/bin/bash

rsync -ac /home/van/ /tmp/backup/ --delete --progress
if [ $? = 0 ]
then
echo 'the backup was succesfully created at' $(date) >> /var/log/neto_backup.log
else
echo "there is an error during backupping at" $(date) >> /var/log/neto_backup.log
fi

