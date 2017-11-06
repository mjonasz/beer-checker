defmodule BeerCheckerTest.Mikkeller do
  use ExUnit.Case
  import BeerChecker.Mikkeller

  test "check always unavailable beer" do
    url = "https://shop.mikkeller.dk/products/beer-geek-vanilla-shake-ba-bourbon"
    [{result, _}] = check([url])
    assert result == :unavailable
  end

  test "check always available beer" do
    url = "https://shop.mikkeller.dk/products/mikkeller-beer-mail"
    {result, _} = check(url)
    assert result == :available
  end
end
