#!/bin/bash
sudo apt-get update -y 
sudo apt-get install nginx -y
echo "Hi Rajan" | sudo tee /var/www/html/index.nginx-debian.html
sudo systemctl start nginx