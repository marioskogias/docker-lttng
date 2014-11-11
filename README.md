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

In order to run the image you should configure the ip and the port that the
Zipkin collector can be found. To do that set the server and the port number in
deploy/params/zipkin.conf before deploying the image. 

The container exports ports 5342, 5343 and 5344 to the host machine.

So in order to live trace just create an lttng-live session with a net:// parameter
pointing at the ip of the host machine.
