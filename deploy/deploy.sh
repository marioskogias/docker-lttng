#!/bin/bash

IMG="marioskogias/lttng-live"
NAME="lttng-live"

if [[ $CLEANUP == "y" ]]; then
	docker stop $NAME
	docker rm $NAME
fi

echo "** Starting lttng-live"
docker run -d --name=$NAME -v `pwd`/params:/etc/lttng-live -p 5342:5342 -p 5343:5343 -p 5344:5344 $IMG
