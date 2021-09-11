#!/bin/bash
cd app
docker build -t nginx-app .
docker run -d --restart=always -p 8080:80 nginx-app:latest
