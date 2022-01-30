defmodule AdoptingPoolboy.MathSqrtPoolboy.App do
  use Application

  defp app_name do
    :math_sqrt
  end

  defp poolboy_config do
    [
      name: {:local, app_name()},
      worker_module: AdoptingPoolboy.MathSqrtPoolboy.Worker,
      size: 5,
      max_owerflow: 2
    ]
  end

  def start(_type, _args) do
    children = [
      :poolboy.child_spec(app_name(), poolboy_config())
    ]

    opts = [strategy: :one_for_one, name: PoolboyApp.MathSqrt]
    Supervisor.start_link(children, opts)
  end
end
