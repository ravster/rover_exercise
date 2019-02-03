#!/usr/local/bin/ruby

class Rover
  attr_accessor :x, :y, :direction, :commands

  def initialize(x, y, direction, commands)
    @x = x
    @y = y
    @direction = direction
    @commands = commands
  end

  def to_s
    "#{x} #{y} #{direction}"
  end

  def parse_commands()
    commands.split('').each {|c| parse_next_command(c) }

    self
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

class RoverControl
  attr_reader :plateau_size, :rovers

  def initialize(input_string)
      lines = input_string.split("\n")

    plateau_match = lines[0].match(/(\d+) (\d+)/)
    @plateau_size = {
      x: plateau_match[1].to_i,
      y: plateau_match[2].to_i
    }

    @rovers = lines[1..-1].each_slice(2).map do |r|
      match = r.first.match(/(\d+) (\d+) (\w)/)
      commands = r[1]

      Rover.new(
        match[1].to_i,
        match[2].to_i,
        match[3],
        commands
      )
    end
  end

  def run_rovers
    @output = @rovers.map do |r|
      r.parse_commands.to_s
    end
  end

  def print
    puts @output
  end
end

rc = RoverControl.new(File.read('./input.txt'))
rc.run_rovers
rc.print
