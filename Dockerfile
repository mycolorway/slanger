# HOWTO:
#   1. git clone on server
#   2. docker build -t some_registry/slanger:latest .
#   3. docker push some_registry/slanger:latest

# NOTE: failed to build native extensions for json 1.8 on ruby 2.4.4
FROM ruby:2.3.7

# place before adding https apt source
RUN apt-get update -qq && apt-get install -y apt-transport-https

RUN apt-get update -qq && apt-get install -y \
  build-essential

ENV APP_HOME=/app

RUN bundle config mirror.https://rubygems.org https://gems.ruby-china.org

RUN mkdir $APP_HOME
WORKDIR $APP_HOME
COPY . $APP_HOME

RUN bundle
