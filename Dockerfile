FROM node:14.15.1 AS builder
LABEL maintainer="ahmadgfari@gmail.com"
LABEL stage=builder

WORKDIR /opt/ng
#COPY package.json ./
COPY . ./
RUN npm install --pure-lockfile

ENV PATH="./node_modules/.bin:$PATH" 

#COPY . ./
ARG APP_ENV_NAME
#RUN node --max-old-space-size=4096 ./node_modules/@angular/cli/bin/ng build --${APP_ENV_NAME}
RUN npm run ${APP_ENV_NAME}
FROM nginx:1.20.1
ARG APP_NAME
#COPY docker/nginx/default.conf /etc/nginx/conf.d/default.conf
COPY --from=builder /opt/ng/dist/${APP_NAME} /usr/share/nginx/html
COPY infra/nginx/default.conf /etc/nginx/conf.d/default.conf
