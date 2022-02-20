FROM local/c7-systemd
#FROM zerept/c7-systemd
WORKDIR /
RUN mkdir -p /app && mkdir -p /run/php-fpm && mkdir -p /etc/nginx/conf.d
COPY default-entrypoint.sh .
COPY app/ /app
COPY nginx.conf .
COPY default.conf /etc/nginx/conf.d/
RUN chmod +x default-entrypoint.sh

RUN yum install nginx -y
COPY /nginx.conf /etc/nginx/nginx.conf

RUN rpm -Uvh --reinstall https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
RUN rpm -Uvh https://rpms.remirepo.net/enterprise/remi-release-7.rpm
RUN yum-config-manager --enable remi-php74 && yum update -y
RUN yum install php php-common php-opcache php-mcrypt php-cli php-gd php-curl php-mysql php-fpm -y

ln -sf /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime

ENTRYPOINT ["sh","default-entrypoint.sh"]

EXPOSE 8080
