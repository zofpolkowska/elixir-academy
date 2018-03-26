defmodule HOF do

  def repeat([], fun, _t), do: fun
  def repeat(args, _fun, 0), do: args
  def repeat(args, fun, t) do
    try do
      repeat(:erlang.apply(fun, args), fun, t-1)
    rescue
      _ in BadArityError -> IO.puts "no result, BadArrityError "
      _ in ArgumentError -> IO.puts "no result, ArgumentError"
      _ in ArithmeticError -> IO.puts "no result, ArithmeticError"
      _ in CompileError -> IO.puts "no result, CompileError"
    end
  end
end
