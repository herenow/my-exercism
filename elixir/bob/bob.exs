defmodule Bob do
  def hey(input) do
    cond do
        input |> is_blank? -> "Fine. Be that way!"
        input |> is_question? -> "Sure."
        input |> is_yelling? -> "Whoa, chill out!"
        true -> "Whatever."
    end
  end

  defp is_question?(input) do
    input |> String.ends_with?("?")
  end

  defp is_yelling?(input) do
    upcase_input  = input |> String.upcase
    downcase_input = input |> String.downcase

    cond do
      upcase_input == downcase_input -> false
      input == upcase_input -> true
      true -> false
    end
  end

  defp is_blank?(input) do
    input |>
    String.replace_trailing(" ", "") |>
    String.equivalent?("")
  end
end
