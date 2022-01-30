defmodule AdoptingPoolboyWeb.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      AdoptingPoolboyWeb.Telemetry,
      # Start the Endpoint (http/https)
      AdoptingPoolboyWeb.Endpoint,
      # Start a worker by calling: AdoptingPoolboyWeb.Worker.start_link(arg)
      # {AdoptingPoolboyWeb.Worker, arg},
      %{
        id: AdoptingPoolboyWeb.Controllers.PoolboyApp.MathSqrt,
        start: {AdoptingPoolboyWeb.Controllers.PoolboyApp.MathSqrt, :start, [[], []]}
      }
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: AdoptingPoolboyWeb.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    AdoptingPoolboyWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end