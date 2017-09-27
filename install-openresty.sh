#!/bin/bash

apt install unzip

cd /opt
wget ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre/pcre-8.41.zip
wget https://openresty.org/download/openresty-1.11.2.5.tar.gz
wget https://www.openssl.org/source/openssl-1.0.2l.tar.gz

# install pcre
unzip pcre-8.41.zip
cd pcre-8.41/
./configure
make && make install

# install openssl
tar -xvzf /opt/openssl-1.0.2l.tar.gz
cd /opt/openssl-1.0.2l/
./config
make && make install

# install openresty
tar -xvzf /opt/openresty-1.11.2.5.tar.gz
cd /opt/openresty-1.11.2.5/
./configure -j2 --with-openssl=/opt/openssl-1.0.2l
make && make install

ln -sf /usr/local/openresty/nginx/sbin/nginx /usr/local/openresty/bin/openresty
