FROM ubuntu:14.04
MAINTAINER "korea-lee"
LABEL "purpose"="practice"
RUN apt-get update
RUN apt-get install apache2 -y
COPY test.html /var/www/html
WORKDIR /var/www/html
RUN ["/bin/bash", "-c", "echo hello >> test.html"]
EXPOSE 80
CMD apachectl -D FOREGROUND

docker build -f Dockerfile3 -t mybuild:0.0 .
docker run -d -P --name myapacheserver mybuild:0.0
docker port myapacheserver
