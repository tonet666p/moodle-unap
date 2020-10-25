FROM centos:centos8

EXPOSE 80
EXPOSE 443

#RUN mkdir /moodledata && chown php:nginx /moodledata
#VOLUME /moodledata/
#RUN mkdir /www/public && chown php:nginx /www/public
#VOLUME /www/public

RUN dnf -y install \
	httpd \
	php

RUN mkdir /moodledata && chown apache:apache /moodledata
VOLUME /moodledata/

RUN find /var/www/html/ -type d -exec chmod -R 555 {} \; \
    && find /var/www/html/ -type f -exec chmod -R 444 {} \;
#RUN systemctl enable --now httpd
ENTRYPOINT ["/usr/sbin/httpd"]
CMD ["-D","FOREGROUND"]
