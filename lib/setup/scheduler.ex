defmodule BeerChecker.Scheduler do
  use GenServer
  require Logger

  def start_link(state) do
    GenServer.start_link(__MODULE__, state, name: __MODULE__)
  end

  def init(state) do
    # we are using delayed first execution to avoid problems with error handling in supervisor init
    schedule_work(10)
    {:ok, state}
  end

  def handle_info(:work, state) do
    execute()
    schedule_work() # Reschedule once more
    {:noreply, state}
  end

  defp execute() do
    Logger.info("starting scheduled job")
    results = BeerChecker.main()
    Logger.info("finished ok")
    Logger.debug("results: #{inspect(results)}")
  end

  defp schedule_work(seconds \\ 60) do
    Process.send_after(self(), :work, seconds * 1000) # every <seconds> seconds
  end
end