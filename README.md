# Rover exercise

## Tools used

- Docker

## Instructions to run

- Build docker image: `docker build -t ravi .`
- Run docker image with the input file mounted as a volume: `docker run -v /PATH/TO/input.txt:/usr/src/input.txt ravi`

## How to run tests

- `ruby test/test_rover.rb` from within `/usr/src/` in the docker container.
