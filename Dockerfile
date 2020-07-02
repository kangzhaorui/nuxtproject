FROM node:12.16.2

ENV PORT 3000
ENV WORK_DIR /app

ADD . ${WORK_DIR}
WORKDIR ${WORK_DIR}

RUN yarn install

EXPOSE ${PORT}

CMD ["yarn", "run", "start"]
