FROM ruby:alpine

RUN bundle config --global frozen 1

RUN apk add --no-cache git build-base postgresql-dev

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY Gemfile /usr/src/app/
COPY Gemfile.lock /usr/src/app/

#nokogiri can't build libxml on alpine
RUN bundle config build.nokogiri --use-system-libraries
RUN bundle install

COPY . /usr/src/app

CMD foreman start -f Procfile.dev