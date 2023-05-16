# syntax = docker/dockerfile:1

# Make sure RUBY_VERSION matches the Ruby version in .ruby-version and Gemfile
ARG RUBY_VERSION=3.1.2
FROM ruby:$RUBY_VERSION-slim as base

LABEL fly_launch_runtime="rails"

# Rails app lives here
WORKDIR /rails

# Set production environment
ENV RAILS_ENV="production" \
    BUNDLE_WITHOUT="development:test" \
    BUNDLE_DEPLOYMENT="1"

# Update gems and bundler
RUN gem update --system --no-document && \
    gem install -N bundler

# Install packages needed to install nodejs
# RUN apt-get update -qq && \
#     apt-get install --no-install-recommends -y curl && \
#     rm -rf /var/lib/apt/lists /var/cache/apt/archives

# Install Node.js
# ARG NODE_VERSION=18.14.2
# ENV PATH=/usr/local/node/bin:$PATH
# RUN curl -sL https://github.com/nodenv/node-build/archive/master.tar.gz | tar xz -C /tmp/ && \
#     /tmp/node-build-master/bin/node-build "${NODE_VERSION}" /usr/local/node && \
#     rm -rf /tmp/node-build-master


# Throw-away build stage to reduce size of final image
FROM base as build

# Install packages needed to build gems and node modules
RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y build-essential libpq-dev libvips nodejs node-gyp pkg-config python

# RUN apt-get update -qq && \
#     apt-get install --no-install-recommends -y build-essential libpq-dev libvips pkg-config python

# Install yarn
# ARG YARN_VERSION=1.22.15
# RUN npm install -g yarn@$YARN_VERSION

# Build options
# ENV PATH="/usr/local/node/bin:$PATH"

# Install application gems
COPY Gemfile Gemfile.lock .
RUN bundle install

# Install node modules
# COPY package.json yarn.lock .
# RUN yarn install --frozen-lockfile

# Copy application code
COPY . .

# Adjust binfiles to set current working directory
RUN grep -l '#!/usr/bin/env ruby' /rails/bin/* | xargs sed -i '/^#!/aDir.chdir File.expand_path("..", __dir__)'

# Precompiling assets for production without requiring secret RAILS_MASTER_KEY
RUN SECRET_KEY_BASE=DUMMY ./bin/rails assets:precompile
# ARG RAILS_MASTER_KEY
# RUN RAILS_MASTER_KEY=${RAILS_MASTER_KEY} RAILS_ENV=production bundle exec rails assets:precompile

# Final stage for app image
FROM base

# Install packages needed for deployment
RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y imagemagick libvips postgresql-client nodejs && \
    rm -rf /var/lib/apt/lists /var/cache/apt/archives

# Run and own the application files as a non-root user for security
RUN useradd rails
USER rails:rails

# Copy built artifacts: gems, application
COPY --from=build /usr/local/bundle /usr/local/bundle
COPY --from=build --chown=rails:rails /rails /rails

# Deployment options
ENV RAILS_LOG_TO_STDOUT="1" \
    RAILS_SERVE_STATIC_FILES="true"

# Entrypoint prepares the database.
ENTRYPOINT ["/rails/bin/docker-entrypoint"]

# Start the server by default, this can be overwritten at runtime
EXPOSE 3000
CMD ["./bin/rails", "server"]
