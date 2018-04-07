defmodule BoundNatural do
   @moduledoc """
   Bound natural numbers generator
   ## Example
      iex> stream = Boundnatural.stream(limit: 50)
      [1 | #Function<1.23635164/0 in Caffeine.Stream.map/2>]
      iex(3)> Caffeine.Stream.take(stream, 7)
      [1, 12, 19, 10, 19, 20, 33]
  """
  def stream(limit: i) do
    s = LCG.stream(1,LCG.MMIX.instance())
    Caffeine.Stream.map(s, limit(i) )
  end

  defp limit(i) do
    fn x ->
      Integer.mod(x, i) end
  end
end
