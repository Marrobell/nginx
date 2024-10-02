FROM debian
RUN mkdir /http
WORKDIR /http
COPY . /http/
RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y nginx
RUN rm -r /etc/nginx/nginx.conf
RUN rm -r /etc/nginx/sites-enabled/default
RUN rm -r /etc/nginx/sites-available/default
COPY ./project/nginx.conf /etc/nginx/nginx.conf
COPY ./html/files/marrobell.html /var/www/html/marrobell.html
COPY ./project/conf-files/default /etc/nginx/sites-enabled/default
COPY ./project/conf-files/default /etc/nginx/sites-available/default
RUN apt install -y sudo
RUN apt-get install -y systemd
COPY start.sh /http/start.sh
RUN chmod +x /http/start.sh
ENTRYPOINT ["bash", "start.sh"]
