defmodule Generator.LCG do
  defmodule Parameters do
    defstruct [
      modulus: 9,
      multiplier: 2,
      increment: 0 ]

    def okay?(parameters) do
      m = parameters.modulus
      a = parameters.multiplier
      c = parameters.increment

      x = 0 < m
      y = (0 < a and a < m)
      z = (0 <= c and c < m)

      x and y and z
    end
  end

  def instance(p) do
    m = p.modulus; a = p.multiplier; c = p.increment
    fn seed when 0 <= seed and seed < m ->
      Integer.mod(a * seed + c, m)
    end
  end

  def stream(seed, generator) do
    [seed | fn -> stream(generator.(seed), generator) end]
  end

  defmodule Eager do
    def take(_, 0), do: []
    def take(stream, n) do
      [e|rest] = stream
      [e|take(rest.(), n-1)]
    end
  end

  defmodule Lazy do
    def map([], _) do
      []
    end
    def map(s, f) do
      [e|rest] = s
      [f.(e) | fn ->
        map(rest.(), f)
      end]
    end
  end

  defmodule MMIX do
    def stream do
      x = %Generator.LCG.Parameters{
        modulus:    round(:math.pow(2, 64)),
        multiplier: 6364136223846793005,
        increment:  1442695040888963407
      }
      true = Generator.LCG.Parameters.okay?(x)
      Generator.LCG.instance(x)
    end
  end

  defmodule Example do
    def f do
      m = Generator.LCG.MMIX.stream()
      Generator.LCG.stream(1, m)
      |> Generator.LCG.Lazy.map(&Integer.to_string/1)
      |> Generator.LCG.Eager.take(12)
    end
  end
end
