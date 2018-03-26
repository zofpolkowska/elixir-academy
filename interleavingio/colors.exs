### Examples of interleaving reading and writing IO ###

# depending on the input from the user the color of text is being changed


defmodule Colors do
  import IO.ANSI
  @plus 43
  @minus 45
  @multiply 42
  @divide 47
  @space 32
  @line 10

  def stringify(@plus), do: IO.write red() <> "+"
  def stringify(@minus), do: IO.write green() <> "-"
  def stringify(@multiply), do: IO.write yellow() <> "*"
  def stringify(@divide), do: IO.write cyan() <> "/"
  def stringify(@space), do: IO.write reset() <> " "
  def stringify(@line), do: IO.write reset() <> "\n"
  def stringify(char), do: IO.write reset() <> Integer.to_string(char - 48)

  #infinite loop input - output -input ...
  def start do
    IO.gets("Enter an expression\n")
    |> String.trim
    |> String.to_charlist
    |> Enum.map(&Colors.stringify/1)
    IO.puts "\n"
    start()
  end
end

if (not(IEx.started?)) do
  Colors.start()
end
