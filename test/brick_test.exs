defmodule BrickTest do
  use ExUnit.Case

  import Tetris.Brick

  test "Creates a new brick from struct" do
    assert new().name == :i
  end 

  test "Creates a new random brick" do
    brick = new_random()

    assert brick.name in ~w/i l z o t/a
    assert brick.rotation in [0, 90, 180, 270]
    assert brick.reflection in [true, false]
  end

  test "Manipulate the brick" do
    actual1 =
      new()
      |> down
      |> right
      |> spin_right
      |> spin_left
      |> spin_left

    assert actual1.location == {41, 1}
    assert actual1.rotation == 270

    actual2 =
      new()
      |> spin_right
      |> spin_right
      |> spin_right
      |> spin_right
      |> spin_right

    assert actual2.rotation == 90
  end

end
