defmodule Scrabble do
  @doc """
  Calculate the scrabble score for the word.
  """
  @spec score({String.t, atom}) :: non_neg_integer
  def score({word, :double}), do: score(word) * 2
  def score({word, :triple}), do: score(word) * 3

  @spec score(String.t) :: non_neg_integer
  def score(word) do
    String.upcase(word) |> to_char_list |> Enum.reduce(0, &(&2 + score_letter(&1)))
  end


  defp score_letter({letter, :double}), do: score_letter(letter) * 2
  defp score_letter({letter, :triple}), do: score_letter(letter) * 3
  defp score_letter(letter) do
    cond do
      letter in [?A, ?E, ?I, ?O, ?U, ?L, ?N, ?R, ?S, ?T] ->
        1
      letter in [?D, ?G] ->
        2
      letter in [?B, ?C, ?M, ?P] ->
        3
      letter in [?F, ?H, ?V, ?W, ?Y] ->
        4
      letter == (?K) ->
        5
      letter in [?J, ?X] ->
        8
      letter in [?Q, ?Z] ->
        10
      true ->
        0
    end
  end
end
