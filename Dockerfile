FROM ruby:slim

RUN bundle config --global frozen 1

#Debian has a really old nodejs, pull in the 4.x LTS
RUN curl -sL https://deb.nodesource.com/setup_4.x | bash -
RUN apt-get update && apt-get install -y git build-essential libpq-dev nodejs npm

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY Gemfile /usr/src/app/
COPY Gemfile.lock /usr/src/app/

RUN bundle install

COPY . /usr/src/app

RUN cd client && npm install

CMD foreman start -f Procfile.dev