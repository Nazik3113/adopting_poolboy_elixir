defmodule AdoptingPoolboyWeb.Controllers.PoolboyWorkers.MathSqrt do
  use GenServer

  def start_link(_) do
    GenServer.start_link(__MODULE__, nil)
  end

  def init(_) do
    {:ok, nil}
  end

  def handle_call({:square_root, x}, _from, state) do
    IO.puts("процесс #{inspect(self())} считает квадратный корень из #{x}")
    Process.sleep(1000)
    {:reply, :math.sqrt(x), state}
  end
end
