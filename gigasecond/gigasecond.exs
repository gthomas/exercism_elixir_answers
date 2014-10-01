defmodule Gigasecond do
	@doc """
	Calculate a date one billion seconds after an input date.
	"""
	@spec from({pos_integer, pos_integer, pos_integer}) :: :calendar.date

	def from(date) do
    seconds = :calendar.datetime_to_gregorian_seconds({date, {0, 0, 0}})
    {result, {_, _, _}} = :calendar.gregorian_seconds_to_datetime(seconds + 1000000000)
    result
	end
end
