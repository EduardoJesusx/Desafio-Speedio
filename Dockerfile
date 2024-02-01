FROM ruby:3.0.2-alpine

ENV APP_PATH /app
ENV BUNDLER_VERSION 2.5.5
ENV BUNDLE_PATH /usr/local/bundle/gems
ENV TMP_PATH /tmp/
ENV RAILS_PORT 3000



# Copy the Gemfile and Gemfile.lock into the container
COPY Gemfile Gemfile.lock ./

# Install dependencies using Alpine package manager
RUN apk --update add --virtual build-dependencies build-base && \
    gem install bundler && \
    bundle install --jobs "$(nproc)" --retry 3 && \
    apk del build-dependencies

COPY . .

COPY . /app


EXPOSE $PORT

CMD ["rails", "server", "-b", "0.0.0.0"]