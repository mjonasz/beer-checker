defmodule BeerChecker.Mixfile do
  use Mix.Project

  def project do
    [
      app: :beer_checker,
      version: "0.1.0",
      elixir: "~> 1.5",
      start_permanent: Mix.env == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # http client
      {:httpoison, "~> 0.13"},

      # html parser
      {:floki, "~> 0.18.0"},

      # emails
      {:bamboo, "~> 0.8"},

      # release tool
      {:distillery, "~> 1.5", runtime: false}
    ]
  end
end
