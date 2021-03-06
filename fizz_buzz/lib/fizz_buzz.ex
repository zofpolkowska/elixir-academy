defmodule FizzBuzz do
  def stringify(n) do
    cond do
      rem(n,3) === 0 and rem(n,5) === 0 ->
        "FizzBuzz"
      rem(n,3) === 0 ->
        "Fizz"
      rem(n,5) === 0 ->
        "Buzz"
      true ->
        Integer.to_string(n)
     end
  end
end

#Enum.each(Enum.map(1..10, &FizzBuzz.stringify/1),&IO.puts/1)
if (not(IEx.started?)) do
     1..100
     |> Enum.map(&FizzBuzz.stringify/1)
     |> Enum.each(&IO.puts/1)
end
