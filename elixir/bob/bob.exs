defmodule Bob do
  def hey(input) do
    cond do
        is_blank?(input) -> "Fine. Be that way!"
        is_question?(input) -> "Sure."
        is_yelling?(input) -> "Whoa, chill out!"
        true -> "Whatever."
    end
  end

  defp is_question?(input) do
    String.ends_with?(input, "?")
  end

  defp is_yelling?(input) do
    upcase_input  = String.upcase(input)
    downcase_input = String.downcase(input)

    cond do
      upcase_input == downcase_input -> false
      input == upcase_input -> true
      true -> false
    end
  end

  defp is_blank?(input) do
    input = String.replace_trailing(input, " ", "")

    String.equivalent?(input, "")
  end
end
