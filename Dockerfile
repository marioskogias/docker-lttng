FROM debian:wheezy
MAINTAINER Marios Kogias
RUN apt-get update
RUN apt-get install -y git libpopt-dev uuid-dev libxml2-dev automake autoconf libtool flex \
	bison make libc6 libc6-dev libglib2.0-0 libglib2.0-dev libpopt-dev python-pip python-dev

#Install lttng related 
RUN git clone git://git.lttng.org/userspace-rcu.git
RUN (cd userspace-rcu; ./bootstrap ; ./configure ; make ; make install ; ldconfig ; cd ..)
RUN git clone git://git.lttng.org/lttng-ust.git
RUN (cd lttng-ust; ./bootstrap ; ./configure ; make ; make install ; ldconfig; cd ..)
RUN git clone git://git.lttng.org/lttng-tools.git
RUN (cd lttng-tools; git reset --hard 40fc532 ; ./bootstrap ; ./configure ; make ; make install ; ldconfig; cd ..)

RUN git clone -b zipkin-live https://github.com/marioskogias/babeltrace
RUN (cd babeltrace; ./bootstrap ; ./configure ; make ; make install ; ldconfig; cd ..)

#install live support
RUN git clone -b pipe-input https://bitbucket.org/marioskogias/trace

RUN pip install facebook-scribe

ADD live.sh /usr/local/bin/live
ENTRYPOINT ["/usr/local/bin/live"]

EXPOSE 5342 5343 5344
