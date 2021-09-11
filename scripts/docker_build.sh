#!/bin/bash
cd /home/ec2-user/app
docker build -t nginx-app .
docker run -d --restart=always -p 8080:80 nginx-app:latest
