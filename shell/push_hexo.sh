#!/bin/bash
target=/root/docker_hexo_docsify
eval `ssh-agent -s`
ssh-add /root/.ssh/homeinchina
a=`cd $target/data/blog/ && git pull`
echo $a
b=`cd $target/ && docker-compose -f "docker-compose.yml" restart hexo-svc`
echo $b
