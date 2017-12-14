defmodule BeerCheckerTest.Mikkeller do
  use ExUnit.Case
  import BeerChecker.Mikkeller

  test "check always unavailable beer" do
    url = "https://shop.mikkeller.dk/products/beer-geek-vanilla-shake-ba-bourbon"
    [{result, _, _}] = check([url])
    assert result == :unavailable
  end

  test "check always unavailable beer implicit" do
    [{result, _, _}] = check()
    assert result == :unavailable
  end

  test "check always available beer" do
    url = "https://shop.mikkeller.dk/products/mikkeller-beer-mail"
    {result, _, _} = check_single(url)
    assert result == :available
  end
end
