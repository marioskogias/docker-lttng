#!/bin/bash

server="snf-204430.vm.okeanos.grnet.gr"
port=9410

#fix pipe
pipe_file="/var/run/babeltrace-pipe"
mkfifo $pipe_file

echo "*****Created pipe ******"
#relayd
/usr/local/bin/lttng-relayd -d


echo "*****Started relayd ******"

# get session if empty try again in one sec until not empty
get_ses=$(babeltrace -i lttng-live net://localhost)

while [ "$get_ses" == "" ]
do
    sleep 1
    get_ses=$(babeltrace -i lttng-live net://localhost)
done

echo "*****Got session ******"
echo $get_ses
session=$(echo $get_ses | tr " " "\n" | head -1)
echo $session

babeltrace -i lttng-live  $session > $pipe_file &
echo "*****Started babeltrace-live  ******"
python trace/python_consumer/consumer.py $server $port /var/run/babeltrace-pipe 
