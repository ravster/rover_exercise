require "minitest/autorun"
load "run_rovers.rb"

class RoverTest < Minitest::Test
  def test_print
    assert_equal "2 3 W", Rover.new(2, 3, 'W').to_s
  end
end
