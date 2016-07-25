defmodule ListOps do
  # Please don't use any external modules (especially List) in your
  # implementation. The point of this exercise is to create these basic functions
  # yourself.
  #
  # Note that `++` is a function from an external module (Kernel, which is
  # automatically imported) and so shouldn't be used either.

  @spec count(list) :: non_neg_integer
  def count(l) do
    count(l, 0)
  end

  def count([h|t], acc) do
    count(t, acc + 1)
  end

  def count([], acc) do
    acc
  end

  @spec reverse(list) :: list
  def reverse(l) do
    reverse(l, [])
  end

  def reverse([h|t], acc) do
    reverse(t, [h | acc])
  end

  def reverse([], acc) do
    acc
  end

  @spec map(list, (any -> any)) :: list
  def map(l, f) do
    map(l, f, [])
  end

  def map([h|t], f, acc) do
    map(t, f, [f.(h) | acc])
  end

  def map([], _, acc) do
    reverse(acc)
  end

  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter(l, f) do
    filter(l, f, [])
  end

  def filter([h|t], f, acc) do
    if f.(h) do
      filter(t, f, [h | acc])
    else
      filter(t, f, acc)
    end
  end

  def filter([], _, acc) do
    reverse(acc)
  end

  @type acc :: any
  @spec reduce(list, acc, ((any, acc) -> acc)) :: acc
  def reduce([h|t], acc, f) do
    reduce(t, f.(h, acc), f)
  end

  def reduce([], acc, _) do
    acc
  end

  @spec append(list, list) :: list
  def append(a, b) do
    append(a, b, [])
  end

  def append([h|t], b, acc) do
    append(t, b, [h | acc])
  end

  def append(a, [h|t], acc) do
    append(a, t, [h | acc])
  end

  def append([], [], acc) do
    reverse(acc)
  end

  @spec concat([[any]]) :: [any]
  def concat(ll) do
    concat(ll, [])
  end

  def concat([h|t], acc) do
    concat(h, t, acc)
  end

  def concat([h|t], tt, acc) do
    concat(t, tt, [h | acc])
  end

  def concat([], t, acc) do
    concat(t, acc)
  end

  def concat([], acc) do
    reverse(acc)
  end
end
