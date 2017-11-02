defmodule BeerChecker.Scheduler do
  use GenServer

  def start_link(state) do
    GenServer.start_link(__MODULE__, state, name: __MODULE__)
  end

  def init(state) do
    execute()
    schedule_work() # Schedule work to be performed at some point
    {:ok, state}
  end

  def handle_info(:work, state) do
    execute()
    schedule_work() # Reschedule once more
    {:noreply, state}
  end

  defp execute() do
    BeerChecker.main()
  end

  defp schedule_work() do
    Process.send_after(self(), :work, 60 * 1000) # every 60 seconds
  end
end