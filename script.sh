#!/bin/bash



# install nginx
sudo su
yum update -yum
yum install nginx -y

# make sure nginx is started
service nginx start
