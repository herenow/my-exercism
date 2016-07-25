defmodule RunLengthEncoder do
  @doc """
  Generates a string where consecutive elements are represented as a data value and count.
  "HORSE" => "1H1O1R1S1E"
  For this example, assume all input are strings, that are all uppercase letters.
  It should also be able to reconstruct the data into its original form.
  "1H1O1R1S1E" => "HORSE"
  """
  @spec encode(String.t) :: String.t
  def encode(string) do
    string
    |> String.codepoints
    |> encoded
  end

  defp encoded([]) do
    ""
  end

  defp encoded([char|rest]) do
    encoded({1, char, rest, ""})
  end

  defp encoded({count, char, [], acc}) do
    acc <> "#{count}#{char}"
  end

  defp encoded({count, char, [next_char|rest], acc}) do
    cond do
      char == next_char ->
        encoded({count + 1, next_char, rest, acc})
      true ->
        acc = acc <> "#{count}#{char}"
        encoded({1, next_char, rest, acc})
    end
  end

  @spec decode(String.t) :: String.t
  def decode(string) do
    Regex.scan(~r/(\d+)(.)/, string, capture: :all_but_first)
    |> List.flatten
    |> decoded
  end

  def decoded([]) do
    ""
  end

  def decoded([count | [char|rest]]) do
    decoded({count, char, rest, ""})
  end

  def decoded([count | [char|rest]], acc) do
    decoded({count, char, rest, acc})
  end

  def decoded([], acc) do
    acc
  end

  def decoded({count, char, rest, acc}) do
    count = count |> String.to_integer
    chars = char |> String.duplicate(count)
    acc = acc <> chars

    decoded(rest, acc)
  end
end
