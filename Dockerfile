FROM ruby:alpine
COPY . /usr/src/app
RUN bundle install
CMD foreman start -f Procfile.dev