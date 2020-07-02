FROM node:12.16.2

ENV PORT 3000
ENV WORK_DIR /app

#设置书名和书源
ENV bookname=人道天堂
ENV bookSourceUrl=https://m.shouda8.com

ADD . ${WORK_DIR}
WORKDIR ${WORK_DIR}

RUN yarn install
RUN yarn run build

EXPOSE ${PORT}

CMD ["yarn", "run", "start"]
