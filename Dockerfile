#On Use debian
FROM debian:10.4

MAINTAINER Nawhath "github@Nawhath"

#Don't ask a question? installation
ENV DEBIAN_FRONTEND noninteractive

#Installation apache , php7.3 and extension
RUN apt update \
&& apt install --yes --no-install-recommends \
apache2 \
php7.3 \
php7.3-mysql \
php7.3-ldap \
php7.3-xmlrpc \
php7.3-imap \
curl \
php7.3-curl \
php7.3-gd \
php7.3-mbstring \
php7.3-xml \
php7.3-apcu-bc \
php-cas \
php7.3-intl \
php7.3-zip \
php7.3-bz2 \
cron \
wget \
ca-certificates \
jq \
&& rm -rf /var/lib/apt/lists/*

#Copy script install glpi to container
COPY glpi-start.sh /opt/
RUN chmod +x /opt/glpi-start.sh
ENTRYPOINT ["/opt/glpi-start.sh"]

#Ports Expose
EXPOSE 80 443
