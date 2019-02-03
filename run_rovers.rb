#!/usr/local/bin/ruby

def print_input(input = "./input.txt")
  input = File.read(input)

  p input
end

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

  def parse_next_command(command)
    # TODO What happens if the command sends the rover off the plateau?  Thats a nasty edge case.
    # TODO What happens if the commands sends the rover into a square occupied by another rover?
    case command
    when "M"
      move_forward
    when "L"
      rotate_left
    when "R"
      rotate_right
    else
      raise ArgumentError, "#{command} is an invalid command"
    end
  end

  def rotate_right
    @direction = case @direction
                 when 'N'
                   'E'
                 when 'E'
                   'S'
                 when 'S'
                   'W'
                 when 'W'
                   'N'
                 else
                   raise "Direction should not be #{direction}."
                 end

    self
  end

  def rotate_left
    @direction = case @direction
                 when 'N'
                   'W'
                 when 'E'
                   'N'
                 when 'S'
                   'E'
                 when 'W'
                   'S'
                 else
                   raise "Direction should not be #{direction}."
                 end

    self
  end

  def move_forward
    case @direction
    when 'N'
      @y += 1
    when 'E'
      @x += 1
    when 'S'
      @y -= 1
    when 'W'
      @x -= 1
    else
      raise "Direction should not be #{direction}."
    end

    self
  end
end
