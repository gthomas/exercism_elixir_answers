defmodule Teenager do
  def hey(input) do
    cond do
      String.strip(input) == "" ->
        "Fine. Be that way!"
      List.last(to_char_list(input)) == ?? ->
        "Sure."
      all_caps(input) and has_letters(input) ->
        "Woah, chill out!"
      true ->
        "Whatever."
    end
  end

  defp all_caps(input) do
    String.upcase(input) == input
  end

  defp has_letters(input) do
    Regex.match?(~r/[\p{L}]/, input)
  end
end
