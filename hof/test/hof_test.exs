defmodule HofTest do
  use ExUnit.Case
  test "simple predictions of fibonacci results" do
    assert Mu.fibonacci(1) === 1
    assert Mu.fibonacci(2) === 1
    assert Mu.fibonacci(3) === 2
    assert Mu.fibonacci(4) === 3
    assert Mu.fibonacci(5) === 5
    assert Mu.fibonacci(6) === 8
  end

  test "simple predictions of results of other similar functions" do
    assert Mu.tribonacci(5) === 13
    assert Mu.lucas(1, 1, 5) === Mu.fibonacci(5)
  end

  test "when P,Q are not 1, 
  from 3rd on fibonacci and lucas numbers should be different" do
    # just 97 first
    fib = Enum.map(3..100, &Mu.fibonacci/1)
    luc = Enum.map(3..100, fn e -> Mu.lucas(5, 6, e) end)
    
    shouldBeEmpty = Enum.filter(Enum.zip(fib,luc), fn {f,l} -> f === l end)
    
    assert Enum.empty?(shouldBeEmpty)
  end

  test "every tribonacci number from 4th on is greater than fibonacci number" do
    # just 96 first
    fib = Enum.map(4..100, &Mu.fibonacci/1)
    trib  = Enum.map(4..100, &Mu.tribonacci/1)

    shouldBeEmpty = Enum.filter(Enum.zip(fib,trib), fn {f,t} -> f >= t end)

    assert Enum.empty?(shouldBeEmpty)
  end

  test "error handling when repeat called with wrong number of arguments" do
    assert  HOF.repeat([1,2,3], &(&1 + &2), 2) == :ok
  end

  test "error handling when repeat called with wrong argument" do
    assert  HOF.repeat([B,'a'], &(&1 + &2), 2) == :ok
    assert  HOF.repeat([B,:xx], &(&1 ++ &2), 2) == :ok
  end 
end
