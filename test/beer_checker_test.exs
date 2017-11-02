defmodule BeerCheckerTest do
  use ExUnit.Case
  doctest BeerChecker

  test "greets the world" do
    assert BeerChecker.hello() == :world
  end
end
