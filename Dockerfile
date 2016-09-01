FROM ruby:alpine

RUN bundle config --global frozen 1

RUN apk add --no-cache git build-base postgresql-dev libxml2-dev libxslt-dev npm

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY Gemfile /usr/src/app/
COPY Gemfile.lock /usr/src/app/

#nokogiri can't build libxml on alpine
RUN bundle config build.nokogiri --use-system-libraries
RUN bundle install

COPY . /usr/src/app

RUN cd client && npm install

CMD foreman start -f Procfile.dev