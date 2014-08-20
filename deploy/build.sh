#!/bin/bash
PREFIX="marioskogias/lttng-"
IMAGE="live"
cd ../lttng-live
docker build -t "$PREFIX$IMAGE" .
