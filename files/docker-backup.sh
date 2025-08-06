#!/bin/bash

RANDOM1=`echo $((RANDOM % 3600))`

#echo sleeping for $RANDOM1 seconds

sleep $RANDOM1

HOST=`hostname`

mkdir -p /data/backups/docker/$HOST

docker ps --format '{{.Names}}' | while read container
do

volumes=`docker inspect -f '{{ .Mounts }}' $container | grep local | wc -l`

if [[ "$volumes" != "0" ]]
then
/root/scripts/docker-volume-backup.sh -a -c $container -o /data/backups/docker/$HOST
fi

done
