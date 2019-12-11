FROM centos:centos7
WORKDIR /var/websites

COPY docker-files/nginx.repo /etc/yum.repos.d/

RUN yum update -y \
yum install -y iptables.i686 iptables-services iptables-utils
#"yum install -y nginx"; \
#"chkconfig iptables on"; \
#"chkconfig nginx on"; \
#"systemctl start nginx"; \
#"systemctl start iptables"; \
#"mv /etc/nginx/conf.d/default.conf /etc/nginx/conf.d/default.conf.OLD"

COPY docker-files/moodle.conf /etc/nginx/conf.d/
#COPY --chown=nginx:nginx . .
