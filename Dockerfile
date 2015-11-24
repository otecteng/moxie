FROM node:4.2.2
RUN npm config set registry https://registry.npm.taobao.org
COPY package.json /src/package.json
RUN cd /src; npm install
COPY . /src
RUN mv /src/bson.ext.js /src/node_modules/monk/node_modules/mongodb/node_modules/bson/ext/index.js
EXPOSE  80
CMD ["node", "/src/bin/www"]