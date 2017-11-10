defmodule BeerChecker.Mikkeller do

  @urls ['https://shop.mikkeller.dk/products/beer-geek-vanilla-shake-ba-bourbon']

  def check(urls \\ @urls) do
    Enum.map(urls, fn (url) -> check_single(url) end)
  end

  def check_single(url) do
    case HTTPoison.get( url) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} -> {parse_availability(body), url}
      {_status, response} -> {:unknown, url, response}
    end
  end

  defp parse_availability(body) do
    if String.downcase(body) =~ "unavailable" do
      :unavailable
    else
      :available
    end
  end

end