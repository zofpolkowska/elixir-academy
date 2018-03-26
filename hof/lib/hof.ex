defmodule HOF do

  def repeat([], fun, _t), do: fun
  def repeat(args, _fun, 0), do: args
  def repeat(args, fun, t) do
    try do
      repeat(:erlang.apply(fun, args), fun, t-1)
    rescue
    # handle when there is wrong number of arguments
      _ in BadArityError -> IO.puts "no result, BadArrityError "
    # handle when the type of argument is wrong
      _ in ArgumentError -> IO.puts "no result, ArgumentError"
      _ in ArithmeticError -> IO.puts "no result, ArithmeticError"

      
      _ in CompileError -> IO.puts "no result, CompileError"
      _ in RuntimeError -> IO.puts "no result, RuntimeError"
    end
  end
end
