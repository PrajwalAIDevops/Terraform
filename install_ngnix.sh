#!/bin/bash

sudo apt update -y
sudo apt install nginx -y
sudo apt install tree -y

sudo systemctl enable nginx
sudo systemctl start nginx

sudo sh -c 'echo "<h1>Hello Prajwal Good Morning</h1>" > /var/www/html/index.html'