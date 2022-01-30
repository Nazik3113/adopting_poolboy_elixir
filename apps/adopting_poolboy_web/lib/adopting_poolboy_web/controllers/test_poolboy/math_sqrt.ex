defmodule AdoptingPoolboyWeb.Controllers.TestPoolboy.MathSqrt do
  @timeout 60000

  def start(start_num, end_num) do
    Enum.map(start_num..end_num, fn num ->
      add_count_sqrt_to_pool(num)
    end)
    |> Task.await_many(@timeout)
  end

  def count_sqrt(num) do
    add_count_sqrt_to_pool(num)
    |> await_taks()
  end

  defp add_count_sqrt_to_pool(num) do
    Task.async(fn ->
      :poolboy.transaction(:worker, &GenServer.call(&1, {:square_root, num}, @timeout), @timeout)
    end)
  end

  defp await_taks(task) do
    Task.await(task, @timeout)
  end
end
