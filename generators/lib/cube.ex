defmodule Cube do
  defmodule V1 do
    def stream do
      stream(0)
    end

    defp stream(n) do
      Caffeine.Stream.construct(cube(n),
        fn -> stream(n+1) end)
    end

    defp cube(x) do
      x * x * x
    end
  end

  defmodule V2 do
    def stream do
      Caffeine.Stream.map(Natural.stream(),
        fn e -> cube(e) end) # &cube/1
    end

    defp cube(x) do
      x * x * x
    end
  end
end
