defmodule DNA do
  @doc """
  Returns number of differences between two strands of DNA, known as the Hamming Distance.

  ## Examples

	iex> DNA.hamming_distance('AAGTCATA', 'TAGCGATC')
	4
	"""
	@spec hamming_distance([char], [char]) :: non_neg_integer
	def hamming_distance(strand1, strand2) do
    if Enum.count(strand1) == Enum.count(strand2) do
      Enum.zip(strand1, strand2) |>
           Enum.count(fn {a, b} -> a != b end)
      end
	end
end
