defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(String.t()) :: String.t()
  def abbreviate(string) do
    string
    |> upcases_and_dashes_to_space
    |> remove_punctuations
    |> split_on_whitespaces
    |> Enum.map(&(&1 |> String.at(0) |> String.capitalize))
    |> Enum.join("")
  end

  defp remove_punctuations(string) do
    string |> String.replace(~r/[\p{P}\p{S}]/, "")
  end

  defp upcases_and_dashes_to_space(string) do
    Regex.replace(~r/([A-Z]+|-+)/, string, " \\0")
  end

  defp split_on_whitespaces(string) do
    string
    |> String.trim
    |> String.split(~r/\s+/)
  end
end
