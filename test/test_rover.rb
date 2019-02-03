require "minitest/autorun"
load "rover.rb"

class RoverTest < Minitest::Test
  def setup
    @rover = Rover.new(2, 3, 'W', 'RMMRMLML')
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

  def test_parse_commands
    assert_equal '3 6 W', @rover.parse_commands().to_s

    assert_raises(RuntimeError) do
      Rover.new(2, 3, 'F', 'LMLMLM').parse_commands().to_s
    end

    assert_raises(ArgumentError) do
      Rover.new(2, 3, 'N', 'LMULMLM').parse_commands().to_s
    end
  end
end

class RoverControlTest < Minitest::Test
  def setup
    @control = RoverControl.new("34 65
1 2 N
LMLMLMLMM
3 3 E
MMRMMRMRRM
1 1 N
MMRMMMLM
3 20 E
MMRMMLMMML
")
  end

  def test_plateau_size_is_read
    assert_equal({x: 34, y: 65}, @control.plateau_size)
  end

  def test_rovers_are_initialized
    assert_equal '3 20 E', @control.rovers[3].to_s
  end

  def test_run_rovers_sets_the_final_locations
    @control.run_rovers
    assert_equal '8 18 N', @control.rovers[3].to_s
  end
end
