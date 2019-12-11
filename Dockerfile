FROM centos:centos7
WORKDIR /var/websites

COPY docker-files/nginx.repo /etc/yum.repos.d/

RUN yum update -y
RUN yum install -y iptables.i686 iptables-services iptables-utils
RUN yum install -y nginx
RUN chkconfig iptables on
RUN chkconfig nginx on
RUN mv /etc/nginx/conf.d/default.conf /etc/nginx/conf.d/default.conf.OLD

COPY docker-files/moodle.conf /etc/nginx/conf.d/
COPY --chown=nginx:nginx . .
