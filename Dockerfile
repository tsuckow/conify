FROM ruby:slim

RUN bundle config --global frozen 1

RUN apt-get update && apt-get install -y git libpq-dev nodejs

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY Gemfile /usr/src/app/
COPY Gemfile.lock /usr/src/app/

RUN bundle install

COPY . /usr/src/app

RUN cd client && npm install

CMD foreman start -f Procfile.dev