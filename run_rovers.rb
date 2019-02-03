#!/usr/local/bin/ruby

load './rover.rb'

rc = RoverControl.new(File.read('./input.txt'))
rc.run_rovers
rc.print
