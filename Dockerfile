FROM ubuntu:14.10

MAINTAINER jamesyale james.yale@specsavers.com

ENV http_proxy http://proxy.uk.specsavers.com:8080
ENV https_proxy http://proxy.uk.specsavers.com:8080
ENV HTTP_PROXY http://proxy.uk.specsavers.com:8080
ENV HTTPS_PROXY http://proxy.uk.specsavers.com:8080


#RUN apt-get -y update \
#  && apt-get -y upgrade \
#  && apt-get -y install squid \
#  && apt-get clean

RUN apt-get -y update \
  && apt-get -y upgrade \
  && apt-get -y install squid \
  && apt-get clean

EXPOSE 3128

VOLUME ["/var/log"]

ENTRYPOINT ["/usr/sbin/squid -N -X -z -f /etc/squid/squid.ssl.conf"]
