# Tech Challenge
This project utilizes docker and httpd/apache to display a single secure webpage with a defined html script. 

## Files
#### *docker-compose.yml*

```
version: '3.9'

services:
  apache:
    image: 'tech_challenge'
    build: .
    ports:
      - 443:443
```
Builds an image based on the local Dockerfile named "tech_challenge". Makes sure port 443 is being able to be heard from the host to the container. 

#### *Dockerfile*

```
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
```
1. Pulls version 2.4 of the image httpd.
2. Updates repositories and installs wget.
3. Uses wget to copy evt-web.html from the weblink to index.html to be displayed on the frontend.
4. Makes a copy of the SSL certificate and key to where apache checks.
5. Makes sure the container is listening on port :443.
6. Updates the config file to activate for accepting SSL connections.

There are two additional files
> server.crt
> server.key
These are the SSL autorization files, containing unique keys.

## How to Run
First make a clone of the github repository using 

```
git clone https://github.com/Edgebird/tech_challenge.git
```

After a local copy has been made. Navigate into the folder *tech_challenge/*.

Once inside the folder run the following command.

```
docker-compose up -d --build
```

After the application has started enter [https://localhost:443](https://localhost:443)

## Why these products

### Docker
Docker was chosen as it is the container manager that I am most familiar with. By utilizing docker compose it will allow for the enviornment to instantiate with a single line. 

### Httpd/apache
Apache was selected as it is one of the most commonly used webservers currently. By being both opensource and a market leader it would be a safe and secure choice.
