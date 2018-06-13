FROM alpine:3.2
MAINTAINER Vivens Ndatinya <ndatinya08@gmail.com>

# Update and install base packages
RUN apk update && apk upgrade && apk add curl wget bash

# Install ruby, ruby-io-console and ruby-bundler
RUN apk add ruby ruby-io-console ruby-bundler

# Clean APK cache
RUN rm -rf /var/cache/apk/*

RUN mkdir /usr/app
WORKDIR /usr/app

COPY Gemfile /usr/app/
COPY Gemfile.lock /usr/app/
RUN bundle install

COPY . /usr/app

# Clean APK cache
RUN rm -rf /var/cache/apk/*

CMD ["ruby", "greeting.rb"]
