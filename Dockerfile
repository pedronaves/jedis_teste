FROM ruby:3.1.2

RUN apt-get clean all && apt-get update -qq && apt-get install -y build-essential libpq-dev \
    curl gnupg2 apt-utils  postgresql-client postgresql-server-dev-all git libcurl3-dev cmake \
    libssl-dev pkg-config openssl imagemagick file nodejs npm yarn

RUN mkdir /rails-app
WORKDIR /rails-app

COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
RUN bundle install

COPY . /rails-app

RUN rails assets:precompile
RUN RAILS_ENV=production bundle exec rake assets:precompile

ENV RAILS_LOG_TO_STDOUT="1" \
    RAILS_SERVE_STATIC_FILES="true"

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]