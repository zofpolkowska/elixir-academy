defmodule Natural do
  def stream do
    stream(0)
  end

  defp stream(n) do
    Caffeine.Stream.construct(n,
      fn -> stream(n+1) end)
  end
end
