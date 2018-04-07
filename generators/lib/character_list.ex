defmodule CharacterList do
  alias BoundNatural
  alias PrintableASCII

  def stream do
    stream(length: BoundNatural.stream(limit: 100), fill: PrintableASCII.stream())
  end

  def stream(length: s, fill: r) do
    {x, y} = split(r, Caffeine.Stream.head(s))
    f = fn ->
      stream(length: Caffeine.Stream.tail(s), fill: y)
    end
    Caffeine.Stream.construct(x, f)
  end

  def split(s, i) do
    {Caffeine.Stream.take(s, i), rest(s, i)}
  end

  def rest(s, 0) do
    s
  end
  def rest(s, i) when i > 0 do
    rest(Caffeine.Stream.tail(s), i - 1)
  end
end
