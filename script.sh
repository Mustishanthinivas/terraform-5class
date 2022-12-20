#!/bin/bash
sudo apt-get update
sudo apt-get install -y nginx jq 
rm -rf devopsb22
git clone -b devopsb22 https://github.com/Mustishanthinivas/dockertest1.git devopsb22
cd devopsb22
sudo cp index.html /var/www/html/index.nginx-debian.html
sudo cp scorekeeper.js /var/www/html/scorekeeper.js
sudo cp style.css /var/www/html/style.css
sed -i '/<h1>testing phase. */a <h1>${var.vpc_name}-public-${count.index}</h1>' /var/www/html/index.nginx-debian.html
sudo service nginx restart
