import Enum
defmodule Grains do

	@doc """
	Calculate two to the power of the input minus one.
	"""

	@spec square(pos_integer) :: pos_integer

	def square(number) do
    Stream.cycle([2]) |>
             take(number - 1) |>
             reduce(1, &(&2 * &1))
	end

	@doc """
	Adds square of each number from 1 to 64.
	"""

	@spec total :: pos_integer

	def total do
		reduce(1..64, 0, &(&2 + square(&1)))
	end

end
