FROM node:12.11

# Also exposing VSCode debug ports
EXPOSE 8000 9929 9230

RUN git config --global user.email "mail@mail.com"
RUN git config --global user.name "Gatsby developer"

RUN npm install --global gatsby-cli

RUN mkdir -p /site
WORKDIR /site
VOLUME /site

COPY ./entrypoint.sh /
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]





