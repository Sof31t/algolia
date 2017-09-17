FROM ruby:2.3.1

# RUN apt-get update \
#    && apt-get install -y --no-install-recommends \
#        postgresql-client \
#    && rm -rf /var/lib/apt/lists/*

RUN apt-get update -y
RUN apt-get install -y make g++=4:4.9.2-2
RUN apt-get install -y --no-install-recommends postgresql-client
RUN rm -rf /var/lib/apt/lists/*
RUN apt-get -qq update
RUN apt-get install -y nodejs npm

RUN gem install bundler -v 1.11.2 --no-ri --no-rdoc

RUN mkdir /src
WORKDIR /src

COPY Gemfile Gemfile.lock ./

RUN bundle install

# Copy the main application.
COPY . ./

CMD ./start-dev.sh
