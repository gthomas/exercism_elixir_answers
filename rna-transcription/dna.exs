defmodule DNA do
  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> DNA.to_rna('ACTG')
  'UGAC'
  """
  @spec to_rna([char]) :: [char]
  def to_rna(dna) do
    dna |> Enum.map(&translate/1)
  end

  defp translate(?A), do: ?U
  defp translate(?C), do: ?G
  defp translate(?T), do: ?A
  defp translate(?G), do: ?C
end
