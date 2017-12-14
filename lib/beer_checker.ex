defmodule BeerChecker do

  def main() do
    BeerChecker.Mikkeller.check()
    |> Enum.map(&send_beer_status/1)
  end

  def send_beer_status({:available, url, _response}) do
    BeerChecker.Email.send("Beer available: #{url}", "Check website: #{url}")
    :available
  end

  def send_beer_status({:unknown, url, response}) do
    BeerChecker.Email.send("Beer status unknown: #{url}", inspect(response))
    :unknown
  end

  def send_beer_status({:unavailable, _url, _response}) do
    :unavailable
  end

end
