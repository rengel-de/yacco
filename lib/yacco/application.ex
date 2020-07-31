defmodule Yacco.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      YaccoWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Yacco.PubSub},
      # Start the Endpoint (http/https)
      YaccoWeb.Endpoint
      # Start a worker by calling: Yacco.Worker.start_link(arg)
      # {Yacco.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Yacco.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    YaccoWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
