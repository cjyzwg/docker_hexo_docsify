#!/bin/bash
target=/root/docker-hexo-docsify
eval `ssh-agent -s`
ssh-add /root/.ssh/homeinchina
a=`cd $target/data/docs/ && git pull`
echo $a
b=`cd $target/ && docker-compose -f "docker-compose.yml" restart docsify-svc`
echo $b
