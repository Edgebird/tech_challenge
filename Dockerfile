FROM httpd:2.4

RUN apt update \
  && apt install -y wget

RUN wget -O /usr/local/apache2/htdocs/index.html https://bitbucket.org/bjgiller/evt-tech-challenge/raw/master/evt-web.html

COPY server.crt /usr/local/apache2/conf/
COPY server.key /usr/local/apache2/conf/
EXPOSE 443

RUN sed -i \
		-e 's/^#\(Include .*httpd-ssl.conf\)/\1/' \
		-e 's/^#\(LoadModule .*mod_ssl.so\)/\1/' \
		-e 's/^#\(LoadModule .*mod_socache_shmcb.so\)/\1/' \
		conf/httpd.conf

