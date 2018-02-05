defmodule BeerChecker.Repeater do
  require Logger

  def repeat(fun, tries) do
    repeat(fun, tries, tries)
  end

  def repeat(fun, 1, _max_tries) do
    fun.()
  end

  def repeat(fun, tries, max_tries) do
    result = fun.()
    case result do
      {:error, _error} -> repeatDelayed(fun, tries - 1, max_tries)
      good_result -> good_result
    end
  end

  defp repeatDelayed(fun, tries, max_tries) do
    :timer.sleep(1000 * (max_tries - tries))
    Logger.debug("Retry no. #{max_tries - tries}")
    repeat(fun, tries, max_tries)
  end

end