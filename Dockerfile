FROM ruby:2.7.2-slim-buster AS base

RUN mkdir -p /app
WORKDIR /app

RUN set -ex \
  && apt-get update \
  && apt-get install -y --no-install-recommends libreadline-dev libpq-dev build-essential postgresql-client

COPY source/Gemfile source/Gemfile.lock /app/

RUN set -ex \
  && gem install bundler && bundle install --jobs 8 --retry 5

FROM base AS api

ENV image_name=app-skeleton

CMD ["bin/api"]
