docker-lttng
============
Dockerfiles for setting up a docker container hosting lttng relayd and sending
tracing information live to Zipkin.

Build image
-----------
In order to build the image:
```
cd deploy; ./build.sh
```

Deploy
------
In order to run the image:
```
cd deploy; ./deploy.sh
```

The container exports ports 5342 5343 5344 to the host machine.
So in order to live trace just create an lttng-live session with net:// parameter
the ip of the host machine.
