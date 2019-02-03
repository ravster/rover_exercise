FROM ruby:2.6.1-alpine3.9

WORKDIR /usr/src

COPY . .

CMD ["ruby", "./run_rovers.rb", "./input.txt"]
