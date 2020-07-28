FROM ruby:2.5

RUN apt-get -y update
RUN mkdir /cassandraWeb
WORKDIR /cassandraWeb

COPY cassandra-web.gemspec /cassandraWeb/cassandra-web.gemspec
COPY Gemfile /cassandraWeb/Gemfile
COPY Gemfile.lock /cassandraWeb/Gemfile.lock
RUN bundle install
COPY . /cassandraWeb

ENTRYPOINT ["./bin/cassandra-web"]
