FROM httpd:2.4.41-alpine
RUN apk update; \
    apk upgrade;

WORKDIR /usr/local/apache2

RUN mkdir -p /var/www/uploads/image/journalist
RUN chown -R www-data:www-data /var/www/uploads
RUN chmod -R 755 /var/www/uploads

COPY demo.apache.conf /usr/local/apache2/conf/demo.apache.conf
RUN echo "Include /usr/local/apache2/conf/demo.apache.conf" \
    >> /usr/local/apache2/conf/httpd.conf

  
