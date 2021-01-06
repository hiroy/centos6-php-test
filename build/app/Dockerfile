FROM centos:6.10

# refer archived URL
RUN sed -i -e "s/^mirrorlist=http:\/\/mirrorlist.centos.org/#mirrorlist=http:\/\/mirrorlist.centos.org/g" /etc/yum.repos.d/CentOS-Base.repo
RUN sed -i -e "s/^#baseurl=http:\/\/mirror.centos.org/baseurl=http:\/\/vault.centos.org/g" /etc/yum.repos.d/CentOS-Base.repo

# system update
RUN yum -y update && yum clean all

RUN yum install -y epel-release
RUN yum install -y glibc-common vim-enhanced tzdata bind-tools

# timezone
RUN echo 'ZONE="Asia/Tokyo"' > /etc/sysconfig/clock \
  && ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

# install httpd and php
RUN yum install -y httpd php php-cli php-common php-devel php-bcmath php-mbstring php-mcrypt php-pgsql php-pdo php-process php-soap php-xml php-xmlrpc php-pecl-ssh2 php-pecl-xdebug

# conf files
COPY php.ini /etc/
COPY test.conf /etc/httpd/conf.d/

# install postgresql
RUN yum install -y postgresql postgresql-server
RUN service postgresql initdb

# init
ENV PGDATA /var/lib/pgsql/data
COPY --chown=postgres:postgres pg_init.sh /usr/local/bin/
RUN chmod 755 /usr/local/bin/pg_init.sh
RUN su - postgres /usr/local/bin/pg_init.sh

COPY app_start.sh /usr/local/bin/
RUN chmod 755 /usr/local/bin/app_start.sh

ENTRYPOINT []
CMD ["app_start.sh"]
