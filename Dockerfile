FROM httpd:2.4
#RUN sed -i 's/udevadm/#udevadm/' /var/lib/dpkg/info/kinetis-design-studio.postinst && dpkg --configure --pending
#RUN apt-get -y update && apt-get install -y apt-transport-https \
#    && apt install -y apache2 \
#RUN openssl req -new -newkey rsa:4096 -days 365 -nodes -x509 -subj \
#    "/C=US/ST=California/L=San Jose/O=tech_challenge/CN=192.168.0.165" \
#    -keyout ./ssl/server.key -out ./ssl/server.crt
#ENV server_name=localhost
#RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf
COPY index.html /usr/local/apache2/htdocs/index.html
COPY my-http.conf /usr/local/apache2/conf/httpd.conf
#COPY 000-defaults.conf /etc/apache2/sites-available/
COPY ./ssl/server.crt /usr/local/apache2/conf/
COPY ./ssl/server.key /usr/local/apache2/conf/
#RUN mkdir -p /var/run/apache2/
EXPOSE 80
