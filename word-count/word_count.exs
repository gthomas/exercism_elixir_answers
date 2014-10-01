defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map()
  def count(sentence) do
    sentence |> to_list |> count_words
  end

  defp to_list(sentence) do
    List.flatten(Regex.scan(~r/[\p{L}0-9\-]+/iu , String.downcase(sentence)))
  end

  defp count_words(words) do
    Enum.reduce(words, %{}, &add_count/2)
  end

  defp add_count(word, counts) do
    Dict.update(counts, word, 1, &(&1 + 1))
  end
end
