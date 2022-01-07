defmodule Tetris.Brick do

  defstruct [
    name: :i,
    location: {40, 0},
    rotation: 0,
    reflection: false
  ]
  
  def new, do: __struct__()

  def new_random do
    %__MODULE__{
      name: random_name(),
      location: {40, 0},
      rotation: random_rotation(),
      reflection: random_reflection()
    }
  end

  def random_name, do: ~w/i l z o t/a |> Enum.random

  def random_rotation, do: [0, 90, 180, 270] |> Enum.random

  def random_reflection, do: [true, false] |> Enum.random

  def down(brick), do: %{brick | location: move_down(brick.location)}
  def left(brick), do: %{brick | location: move_left(brick.location)}
  def right(brick), do: %{brick | location: move_right(brick.location)}

  def move_down({x, y}), do: {x, y + 1}
  def move_left({x, y}), do: {x - 1, y}
  def move_right({x, y}), do: {x + 1, y}

  def spin_right(brick), do: %{brick | rotation: rotate_right(brick.rotation)}

  def rotate_right(270), do: 0
  def rotate_right(degrees), do: degrees + 90

  def spin_left(brick), do: %{brick | rotation: rotate_left(brick.rotation)}

  def rotate_left(0), do: 270
  def rotate_left(degrees), do: degrees - 90
end
