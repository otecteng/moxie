FROM node:4.2.2
COPY package.json /src/package.json
RUN cd /src; npm install
COPY . /src
RUN mv /src/bson.ext.js /src/node_modules/monk/node_modules/mongodb/node_modules/bson/ext/index.js
EXPOSE  8080
CMD ["node", "/src/bin/www"]