require "minitest/autorun"
load "run_rovers.rb"

class RoverTest < Minitest::Test
  def setup
    @rover = Rover.new(2, 3, 'W')
  end

  def test_to_s
    assert_equal "2 3 W", @rover.to_s
  end

  def test_rotate_right
    assert_equal 'N', @rover.rotate_right.direction
    assert_equal 'E', @rover.rotate_right.direction
    assert_equal 'S', @rover.rotate_right.direction
    assert_equal 'W', @rover.rotate_right.direction
  end

  def test_rotate_left
    assert_equal 'S', @rover.rotate_left.direction
    assert_equal 'E', @rover.rotate_left.direction
    assert_equal 'N', @rover.rotate_left.direction
    assert_equal 'W', @rover.rotate_left.direction
  end

  def test_move_forward
    assert_equal '2 4 N', @rover.rotate_right.move_forward.to_s
    assert_equal '3 4 E', @rover.rotate_right.move_forward.to_s
    assert_equal '3 3 S', @rover.rotate_right.move_forward.to_s
    assert_equal '2 3 W', @rover.rotate_right.move_forward.to_s
  end
end
