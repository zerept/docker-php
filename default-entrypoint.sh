#!/bin/bash

sleep 1 && nginx && sleep 1 && nginx -s reload && sleep 1
nginx -v
php-fpm && php && nginx -s reload
php -v
sleep 1
yum clean all -y

sleep 999d
