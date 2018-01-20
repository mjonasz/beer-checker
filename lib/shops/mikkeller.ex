defmodule BeerChecker.Mikkeller do

  @urls ['https://shop.mikkeller.dk/products/beer-geek-vanilla-shake-ba-bourbon']

  def check(urls \\ @urls) do
    Enum.map(urls, fn (url) -> check_single(url) end)
  end

  def check_single(url) do
    case HTTPoison.get(url) do
      {:ok, response} -> {parse_response(response), url, response}
      {_, response} -> {:unknown, url, response}
    end
  end

  defp parse_response(response) do
    case response do
      %HTTPoison.Response{status_code: 200, body: body} -> parse_availability(body)
      %HTTPoison.Response{status_code: 404} -> :unavailable
      _response -> :unknown
    end
  end

  defp parse_availability(html) do
    case find_availability_link(html) do
      "http://schema.org/InStock" -> :available
      "http://schema.org/OutOfStock" -> :unavailable
      _ -> :unknown
    end
  end

  defp find_availability_link(html) do
    Floki.find(html, "link[itemprop=availability]")
    |> Floki.attribute("href")
    |> Enum.join("") # join instead of List.first to detect when there is more than one element found
  end

end