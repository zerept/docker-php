FROM local/c7-systemd
#FROM zerept/c7-systemd
WORKDIR /
RUN mkdir -p /app && mkdir -p /run/php-fpm && mkdir -p /etc/nginx/conf.d
COPY default-entrypoint.sh .
COPY app/ /app
COPY nginx.conf .
COPY default.conf /etc/nginx/conf.d/
RUN chmod +x default-entrypoint.sh
ENTRYPOINT ["sh","default-entrypoint.sh"]
EXPOSE 8080
