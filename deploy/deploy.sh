#!/bin/bash

IMG="marios/lttng-live"
NAME="lttng-live"

if [[ $CLEANUP == "y" ]]; then
	docker stop $NAME
	docker rm $NAME
fi

echo "** Starting lttng-live"
docker run -d --name=$NAME -p 5342:5342 -p 5343:5343 -p 5344:5344 $IMG
