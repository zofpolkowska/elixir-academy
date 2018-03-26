defmodule FizzBuzzTest do
  use ExUnit.Case
  test "simple input + output" do
    assert FizzBuzz.stringify(1) == "1"
    assert FizzBuzz.stringify(3) == "Fizz"
  end

  test "should not return the number when divisible by 3 or 5" do
    neither = Enum.filter(1..100,
      fn i -> not(rem(i,3) === 0 or rem(i,5) === 0) end)
    neither = Enum.map(neither, &Integer.to_string/1)
    actual_output = Enum.map(1..100, &FizzBuzz.stringify/1)
    assert Enum.all?(neither, fn e -> Enum.member?(actual_output, e) end)
  end

  
   test "fu" do  
    threes = Enum.filter(1..100, fn x -> rem(x,3) === 0 end)
    |> Enum.map(&Integer.to_string/1)
    fives = Enum.filter(1..100, fn x -> rem(x,5) === 0 end)
    |> Enum.map(&Integer.to_string/1)
    actual_output = Enum.map(1..100, &FizzBuzz.stringify/1)   
    assert Enum.all?(threes, fn e -> not(Enum.member?(actual_output, e)) end)
    assert Enum.all?(fives, fn e -> not(Enum.member?(actual_output, e)) end)
end

   test "more Fizzes than Buzzes" do
    # given
    actual_output = Enum.map(1..100, &FizzBuzz.stringify/1)
    # when
    num_of_fizzes = Enum.count(actual_output, fn e -> e == "Fizz" end)
    num_of_buzzes = Enum.count(actual_output, fn e -> e == "Buzz" end)
    # then
    assert num_of_fizzes > num_of_buzzes
end
end
