#!/bin/bash
echo " " > .msg
echo " " >> .msg
echo " ########### CONFIGURANDO DATA E HORA ########### "  >> .msg
echo " " >> .msg
ln -sf /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime
dt=$(date '+%d/%m/%Y %H:%M:%S');
echo "      SÃO PAULO - "+"$dt" >> .msg
echo " " >> .msg
sleep 1
echo " ########### DATA E HORA - OK ########### "  >> .msg
echo " "  >> .msg
echo " " >> .msg

echo " ########### CONFIGURANDO GATEWAY - NGINX ########### " >> .msg
yum install nginx -y
echo " " >> .msg
cp /nginx.conf /etc/nginx/nginx.conf
sleep 1 && nginx && sleep 1 && nginx -s reload && sleep 1
nginx -v >> .msg
echo $(nginx -v) >> .msg
echo " " >> .msg
echo " ########### GATEWAY - OK ########### " >> .msg

echo " " >> .msg
echo " ########### INSTALANDO - PHP 7.4 ########### " >> .msg
rpm -Uvh --reinstall https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm && sleep 1
rpm -Uvh https://rpms.remirepo.net/enterprise/remi-release-7.rpm && sleep 1
yum-config-manager --enable remi-php74 && yum update -y && sleep 1
yum install php php-common php-opcache php-mcrypt php-cli php-gd php-curl php-mysql php-fpm -y && sleep 1

echo " " >> .msg
php-fpm && php && nginx -s reload
php -v >> .msg
echo " " >> .msg
echo " ########### php - OK ########### " >> .msg
sleep 1
yum clean all -y
clear
sleep 1
cat .msg

sleep 1d
