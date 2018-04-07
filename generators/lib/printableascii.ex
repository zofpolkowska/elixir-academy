defmodule PrintableASCII do
  def stream do
    f = fn e ->
      lower_limit() + e end
    Caffeine.Stream.map(BoundNatural.stream(limit: length()), f)
  end

    
  defp length, do: upper_limit() - lower_limit()
  defp lower_limit, do: 0x20
  defp upper_limit, do: 0x7E
end
