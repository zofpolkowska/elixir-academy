defmodule PrintableASCII.List do
  def stream do
    stream(BoundNatural.stream(limit: 50), PrintableASCII.stream())
  end

  defp stream(l, s) do
    ln = Caffeine.Stream.head(l)
    cs = Caffeine.Stream.take(s, ln)
    Caffeine.Stream.construct(cs, fn ->
      stream(Caffeine.Stream.tail(l), Caffeine.Stream.tail(s)) end)
  end
end
