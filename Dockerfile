FROM centos:6

MAINTAINER jamesyale james.yale@specsavers.com

COPY ngtech-squid.repo /etc/yum.repos.d/ngtech-squid.repo

RUN yum update -y && yum install -y epel-release && yum clean -y all

RUN yum update -y && yum install -y squid squid-helpers && yum clean -y all

COPY squid-config/squid.ssl.conf /etc/squid/squid.ssl.conf

COPY squid-config/ssl.pem /etc/squid/ssl.pem

# create squid cache dirs
RUN /usr/sbin/squid -N -z -f /etc/squid/squid.ssl.conf

# create ssl_crtd working dir
RUN /usr/lib64/squid/ssl_crtd -c -s /var/spool/squid/ssl_db

EXPOSE 3128

VOLUME ["/var/log"]

CMD ["/usr/sbin/squid", "-N", "-f", "/etc/squid/squid.ssl.conf"]
