FROM centos:centos7.7.1908

RUN yum install -y httpd
RUN systemctl enable httpd
RUN service httpd start
