defmodule ListOps do
  # Please don't use any external modules (especially List) in your
  # implementation. The point of this exercise is to create these basic functions
  # yourself.
  #
  # Note that `++` is a function from an external module (Kernel, which is
  # automatically imported) and so shouldn't be used either.

  @spec count(list) :: non_neg_integer
  def count(l) do
    reduce(l, 0, fn(_, acc) -> acc + 1 end)
  end

  @spec reverse(list) :: list
  def reverse(l) do
    reduce(l, [], &([&1 | &2]))
  end

  @spec map(list, (any -> any)) :: list
  def map(l, f) do
    reduce(reverse(l), [], &([ f.(&1) | &2 ]))
  end

  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter(l, f) do
    reduce(reverse(l), [], fn(el, acc) -> if f.(el) do
                                  [el | acc]
                                 else
                                   acc
                                 end
                  end)
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
    reduce(reverse(a), b, &([ &1 | &2 ]))
  end

  @spec concat([[any]]) :: [any]
  def concat(ll) do
    reduce(ll, [], &(append &2, &1))
  end
end
