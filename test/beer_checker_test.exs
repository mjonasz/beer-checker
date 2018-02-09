defmodule BeerCheckerTest do
  use ExUnit.Case
  import BeerChecker

  test "check always unavailable beers" do
    assert [:unavailable, :unavailable] == main()
  end
end
