FROM node:12.11-stretch

EXPOSE 8000

RUN apt-get update \
    && apt-get -y install git \
    && apt-get clean

RUN git config --global user.email "mail@mail.com"
RUN git config --global user.name "Gatsby developer"

RUN npm install --global gatsby-cli

RUN mkdir -p /site
WORKDIR /site
VOLUME /site

RUN passwd -d root

COPY ./entrypoint.sh /
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]





