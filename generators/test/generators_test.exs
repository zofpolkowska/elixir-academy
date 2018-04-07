defmodule GeneratorsTest do
  use ExUnit.Case
  doctest Generators

  test "the boundnatural generator should be uniform" do
    boundnaturals = Caffeine.Stream.take(BoundNatural.stream(limit: 100), 100)
    epsilon = 5
    assert abs(Enum.count(boundnaturals, fn x -> x >= 50 end) - 50) < epsilon
  end
end
