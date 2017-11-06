defmodule BeerCheckerTest do
  use ExUnit.Case
  import BeerChecker

  test "check always unavailable beer" do
    assert [:unavailable] == main()
  end
end
