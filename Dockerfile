FROM centos:centos7
WORKDIR /var/websites

COPY docker-files/nginx.repo /etc/yum.repos.d/

RUN yum update -y
RUN yum install -y iptables.i686 iptables-services iptables-utils
RUN yum install -y nginx
RUN yum -y install centos-release-scl.noarch
RUN yum install -y rh-php72 rh-php72-php-cli rh-php72-php-common rh-php72-php-dba rh-php72-php-embedded rh-php72-php-bcmath rh-php72-php-enchant rh-php72-php-fpm rh-php72-php-gd rh-php72-php-intl rh-php72-php-mbstring rh-php72-php-mysqlnd rh-php72-php-odbc rh-php72-php-opcache rh-php72-php-pecl-apcu rh-php72-php-soap rh-php72-php-xmlrpc
RUN sed -ir "s/\(listen.*=.*\:\)[0-9]*\(.*\)/\120808/" /etc/opt/rh/rh-php72/php-fpm.d/www.conf
RUN semanage port --add -t http_port_t -p tcp 20808
RUN chkconfig rh-php72-php-fpm on
RUN chkconfig iptables on
RUN chkconfig nginx on
RUN mv /etc/nginx/conf.d/default.conf /etc/nginx/conf.d/default.conf.OLD

COPY docker-files/moodle.conf /etc/nginx/conf.d/
COPY --chown=nginx:nginx . .
