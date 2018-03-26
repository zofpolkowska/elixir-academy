defmodule Mu do
  def fibonacci(n) do
    List.first(HOF.repeat([0, 1], &fibonacci/2, n))
  end

  defp fibonacci(a, b) do
    [b, a + b]
  end

  def tribonacci(n) do
    List.first(HOF.repeat([1, 1, 2], &tribonacci/3, n))
  end

  defp tribonacci(a, b, c) do
    [b, c, a + b + c]
  end

  def lucas(p, q, n) do
    List.first(HOF.repeat([0, 1, p, q], &lucas/4, n))
  end

  defp lucas(a, b, p, q) do
    [b, p*a + q*b, p, q]
  end
  
end
