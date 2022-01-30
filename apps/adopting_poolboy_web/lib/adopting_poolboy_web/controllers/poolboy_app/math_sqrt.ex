defmodule AdoptingPoolboyWeb.Controllers.PoolboyApp.MathSqrt do
  use Application

  defp poolboy_config do
    [
      name: {:local, :worker},
      worker_module: AdoptingPoolboyWeb.Controllers.PoolboyWorkers.MathSqrt,
      size: 5,
      max_owerflow: 2
    ]
  end

  def start(_type, _args) do
    children = [
      :poolboy.child_spec(:worker, poolboy_config())
    ]

    opts = [strategy: :one_for_one, name: PoolboyApp.MathSqrt]
    Supervisor.start_link(children, opts)
  end
end
