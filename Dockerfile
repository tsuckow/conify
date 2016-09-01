FROM ruby:slim

RUN bundle config --global frozen 1

RUN apt-get update && apt-get install -y git build-essential libpq-dev nodejs npm

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY Gemfile /usr/src/app/
COPY Gemfile.lock /usr/src/app/

RUN bundle install

COPY . /usr/src/app

RUN cd client && npm install

CMD foreman start -f Procfile.dev