defmodule AdoptingPoolboy.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the PubSub system
      {Phoenix.PubSub, name: AdoptingPoolboy.PubSub},
      # Start a worker by calling: AdoptingPoolboy.Worker.start_link(arg)
      # {AdoptingPoolboy.Worker, arg}
      %{
        id: AdoptingPoolboy.MathSqrtPoolboy.App,
        start: {AdoptingPoolboy.MathSqrtPoolboy.App, :start, [[], []]}
      },
    ]

    Supervisor.start_link(children, strategy: :one_for_one, name: AdoptingPoolboy.Supervisor)
  end
end
