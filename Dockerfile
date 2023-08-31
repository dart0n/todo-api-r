FROM ruby:2.7.2-alpine3.13

RUN apk add --update --no-cache \
      build-base curl file git libxml2-dev libxslt-dev make postgresql-dev tzdata

WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN bundle check || bundle install

COPY . ./
ENTRYPOINT ["./entrypoints/docker-entrypoint.sh"]