defmodule TPK do
  def read(0), do: []
  def read(n), do: [read()|read(n-1)]

  def read do
    IO.gets("Enter an integer: ")
    |> String.trim
    |> String.to_integer
  end

  def fact(0), do: 1
  def fact(n), do: n * fact(n-1)

  def toobig?(n) when n > 1000, do: "TOO LARGE"
  def toobig?(n), do: n


    

end

TPK.read(3)
|> Enum.map(&TPK.fact/1)
|> Enum.map(&TPK.toobig?/1)
|> Enum.map(&IO.puts/1)
