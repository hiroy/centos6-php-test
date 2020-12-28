FROM centos:6

# refer archived URL
RUN sed -i -e "s/^mirrorlist=http:\/\/mirrorlist.centos.org/#mirrorlist=http:\/\/mirrorlist.centos.org/g" /etc/yum.repos.d/CentOS-Base.repo
RUN sed -i -e "s/^#baseurl=http:\/\/mirror.centos.org/baseurl=http:\/\/vault.centos.org/g" /etc/yum.repos.d/CentOS-Base.repo

# system update
RUN yum -y update && yum clean all

RUN yum install -y epel-release
RUN yum install -y glibc-common vim-enhanced

# install httpd and php
RUN yum install -y httpd php php-cli php-common php-devel php-bcmath php-mbstring php-mcrypt php-pgsql php-pdo php-process php-soap php-xml php-xmlrpc php-pecl-ssh2 php-pecl-xdebug

# conf files
COPY php.ini /etc/php.ini
COPY test.conf /etc/httpd/conf.d/test.conf

CMD ["apachectl", "-D", "FOREGROUND"]
