#echo  "DONOT CHANGE OR EDIT THE FILE Without Informing Subrat"
FROM node:current-alpine
MAINTAINER subrat Mishra <subrat.mishra08@gmail.com>
LABEL Subrats Basic Api testframework NPM Docker.
RUN npm install -g update npm install -g newman npm install -g newman-reporter-html npm install -g newman-reporter-htmlextra
WORKDIR /etc/newman
ENTRYPOINT ["newman"]
