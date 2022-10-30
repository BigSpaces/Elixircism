defmodule ResistorColorDuo do
  @doc """
  Calculate a resistance value from two colors
  """
  @spec value(colors :: [atom]) :: integer


  def value([color1, color2 | _rest]) do
    list = [
      black: 0,
      brown: 1,
      red: 2,
      orange: 3,
      yellow: 4,
      green: 5,
      blue: 6,
      violet: 7,
      grey: 8,
      white: 9
    ]

    (Integer.to_string(list[color1]) <> Integer.to_string(list[color2])) |> String.to_integer()
  end
end
