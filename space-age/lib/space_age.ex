defmodule SpaceAge do
  @type planet ::
          :mercury
          | :venus
          | :earth
          | :mars
          | :jupiter
          | :saturn
          | :uranus
          | :neptune
  @planets [:mercury, :venus, :earth, :mars, :jupiter, :saturn, :uranus, :neptune]

  @doc """
  Return the number of years a person that has lived for 'seconds' seconds is
  aged on 'planet', or an error if 'planet' is not a planet.
  """

  @spec age_on(planet, pos_integer) :: {:ok, float} | {:error, String.t()}
  def age_on(planet, seconds) when planet in @planets do
    planets_orbits = [
      mercury: 0.2408467,
      venus: 0.61519726,
      earth: 1.0,
      mars: 1.8808158,
      jupiter: 11.862615,
      saturn: 29.447498,
      uranus: 84.016846,
      neptune: 164.79132
    ]

    final_calc = seconds / (31_557_600 * planets_orbits[planet])
    {:ok, final_calc}
  end

  def age_on(_planet, _seconds) do
    {:error, "not a planet"}
  end

end
