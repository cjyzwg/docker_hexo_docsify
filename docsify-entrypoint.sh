#!/bin/sh

ROOTDIR=/root
DOCSDIR=/root/docs
cd ${ROOTDIR}
# 如果当前目录为空，则新建一个doc网站
if [ "`ls -A $DOCSDIR`" = "" ]; then
    echo ">>>>>>>>>>> 当前docs目录为空,初始化一个docs网站"
    docsify init ./docs
else
    echo ">>>>>>>>>>> 使用已有的docs"
fi
docsify serve docs
