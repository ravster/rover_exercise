#!/usr/local/bin/ruby

input = File.read("./input.txt")

p input

def plateau_size(input)
  input.split('\n').first
end

class Rover
  attr_accessor :x, :y, :direction

  def initialize(x, y, direction)
    @x = x
    @y = y
    @direction = direction
  end

  def to_s
    "#{x} #{y} #{direction}"
  end
end
