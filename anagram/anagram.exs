defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t, [String.t]) :: [String.t]
  def match(base, candidates) do
    candidates |> Enum.filter(fn(word) -> base !== word
                                          and to_sorted_list(base) == to_sorted_list(word) end)
  end

  defp to_sorted_list(string) do
    string |> String.downcase |> to_char_list |> Enum.sort
  end
end
