FROM node
MAINTAINER Nik Petersen

RUN apt-get install nginx
RUN npm install -g ember-cli && npm install -g bower
RUN mkdir /app

COPY nginx.conf /etc/nginx/nginx.conf

ONBUILD COPY . /app

ONBUILD WORKDIR /app
ONBUILD RUN npm install && bower install
ONBUILD RUN ember build --environment=production

CMD ["nginx", "-g", "daemon off;"]


