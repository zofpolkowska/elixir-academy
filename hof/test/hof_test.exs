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

  test "error handling when repeat called with wrong number of arguments" do
    assert  HOF.repeat([1,2,3], &(&1 + &2), 2) == :ok
  end

  test "error handling when repeat called with wrong argument" do
    assert  HOF.repeat([B,'a'], &(&1 + &2), 2) == :ok
    assert  HOF.repeat([B,:xx], &(&1 ++ &2), 2) == :ok
  end 
end
