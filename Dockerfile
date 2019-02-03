FROM ruby:2.6.1-alpine3.9

RUN bundle config --global frozen 1

COPY Gemfile Gemfile.lock ./
RUN bundle install

WORKDIR /usr/src

COPY . .

CMD ["ruby", "./run_rovers.rb", "./input.txt"]
