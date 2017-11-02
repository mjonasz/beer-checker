defmodule BeerChecker.Mikkeller do

  @urls ['https://shop.mikkeller.dk/products/beer-geek-vanilla-shake-ba-bourbon']

  def check (urls \\ @urls)

  def check(urls) when is_list(urls) do
    Enum.map(urls, fn (url) -> check(url) end)
  end

  def check(url) do
    case HTTPoison.get(url) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        {parse_availability(body), url}
      {_, response} ->
        {:unknown, url, response}
    end
  end

  defp parse_availability(body) do
    if body =~ "Unavailable" do
      :unavailable
    else
      :available
    end
  end

end