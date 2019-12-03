FROM ruby:2.6.5

LABEL "name"="Locomotive"
LABEL "version"="0.0.1"

ENV LC_ALL=C.UTF-8
ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US.UTF-8
ENV REDIS_QUEUE_URL='redis://redis:6379/0'
ENV REDIS_CACHE_URL='redis://redis:6379/0'
ENV PG_HOST='postgres'
ENV PG_USERNAME='postgres'
ENV PG_PASSWORD='postgres'
ENV RAILS_ENV='test'
ENV RACK_ENV='test'
ENV BUNDLE_PATH='/bundle/vendor'

RUN  curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
     echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
     curl -sL https://deb.nodesource.com/setup_13.x | bash - && \
     wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | apt-key add - && \
     echo 'deb http://dl.google.com/linux/chrome/deb/ stable main' | tee /etc/apt/sources.list.d/google-chrome.list && \
     apt-get -yqq install libpq-dev && \
     apt-get install -qq -y google-chrome-stable yarn nodejs postgresql postgresql-contrib

RUN gem install bundler:2.0.2
