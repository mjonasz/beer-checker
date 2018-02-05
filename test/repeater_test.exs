defmodule BeerCheckerTest.Repeater do
  use ExUnit.Case
  import BeerChecker.Repeater

  test "run once exits immediately" do
    start = :os.system_time(:millisecond)
    result = repeat(fn -> {:error, 123} end, 1)
    fin = :os.system_time(:millisecond)
    diff = fin - start
    assert diff < 100
    assert result == {:error, 123}
  end

  test "run three times exists after 3 seconds" do
    start = :os.system_time(:millisecond)
    result = repeat(fn -> {:error, 123} end, 3)
    fin = :os.system_time(:millisecond)
    diff = fin - start
    assert diff > 3000 and diff < 4000
    assert result == {:error, 123}
  end

  test "exits immediately when no error" do
    start = :os.system_time(:millisecond)
    result = repeat(fn -> {:ok, 123} end, 3)
    fin = :os.system_time(:millisecond)
    diff = fin - start
    assert diff < 100
    assert result == {:ok, 123}
  end
end
