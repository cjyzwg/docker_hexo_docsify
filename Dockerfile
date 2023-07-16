ARG NODE_VERSION=14

FROM node:${NODE_VERSION}-alpine
# 更新系统
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories
RUN apk update && apk upgrade
# 设置时区
RUN apk add tzdata && cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && apk del tzdata
# 安装git、nano
RUN apk add git nano
# 配置淘宝镜像源
RUN npm config set registry http://registry.npm.taobao.org/
# 安装hexo脚手架
RUN npm install hexo-cli -g
# 安装docsify脚手架
RUN npm install docsify-cli -g

COPY hexo-entrypoint.sh /usr/local/bin/
RUN chmod a+x /usr/local/bin/hexo-entrypoint.sh

COPY docsify-entrypoint.sh /usr/local/bin/
RUN chmod a+x /usr/local/bin/docsify-entrypoint.sh

# 容器启动的时候默认执行hexo的命令
ENTRYPOINT ["hexo-entrypoint.sh"]
