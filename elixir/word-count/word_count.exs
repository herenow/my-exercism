require Logger;

defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map
  def count(sentence) do
    sentence
    |> normalize_string
    |> count_words_in_string
  end

  defp normalize_string(string) do
    string
    |> String.replace("_", " ") # Split undercored words into two
    |> String.downcase
  end

  defp count_words_in_string(string) do
    words =
      string
      |> string_to_array
      |> remove_blank_words
      |> remove_trailing_punctuations

    Enum.reduce(words, %{}, fn(word, map) ->
      Map.update(map, to_string(word), 1, &(&1 + 1))
    end)
  end

  defp string_to_array(string) do
    string
    |> String.split(" ")
  end

  defp remove_blank_words(words) do
    Enum.reject(words, fn(word) ->
      word
      |> String.replace_trailing(" ", "") # Remove white spaces
      |> String.replace(~r/[\p{P}\p{S}]/, "") # Remove punctuations
      |> String.equivalent?("") # Check if still blank
    end)
  end

  defp remove_trailing_punctuations(words) do
    Enum.map(words, fn(word) ->
      String.replace(word, ~r/[^a-zA-Z0-9]+$/, "")
    end)
  end
end
