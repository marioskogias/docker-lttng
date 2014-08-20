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

You can specify the zipkin instance ip/url and the listening port from the
params/zipkin.conf file before deploying the image.

The container exports ports 5342, 5343 and 5344 to the host machine.

So in order to live trace just create an lttng-live session with a net:// parameter
pointing at the ip of the host machine.
