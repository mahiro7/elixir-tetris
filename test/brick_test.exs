defmodule BrickTest do
  use ExUnit.Case

  import Tetris.Brick

  def new_brick do
    new()
  end

  test "Creates a new brick from struct" do
    assert new_brick().name == :i
  end 

end
