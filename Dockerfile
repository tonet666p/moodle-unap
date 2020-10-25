FROM php:7.4-apache

EXPOSE 80
EXPOSE 443

COPY index.php /var/www/html/


RUN mkdir /moodledata && chown apache:apache /moodledata
VOLUME /moodledata/
