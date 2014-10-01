defmodule ETL do
  @doc """
  Transform an index into an inverted index.

  ## Examples

  iex> ETL.transform(%{"a" => ["ABILITY", "AARDVARK"]}, "b" => ["BALLAST", "BEAUTY"]})
  %{"ability" => "a", "aardvark" => "a", "ballast" => "b", "beauty" =>"b"}
  """
  @spec transform(Dict.t) :: map()
  def transform(input) do
    input |>
      Enum.flat_map(&transform_entry/1) |>
      Enum.into(%{})
  end
  defp transform_entry({k,v}) do
    Enum.map(v, &({String.downcase(&1), k}))
  end
end
