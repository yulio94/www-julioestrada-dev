defmodule WwwJulioestradaDev.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      WwwJulioestradaDev.Repo,
      # Start the Telemetry supervisor
      WwwJulioestradaDevWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: WwwJulioestradaDev.PubSub},
      # Start the Endpoint (http/https)
      WwwJulioestradaDevWeb.Endpoint
      # Start a worker by calling: WwwJulioestradaDev.Worker.start_link(arg)
      # {WwwJulioestradaDev.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: WwwJulioestradaDev.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    WwwJulioestradaDevWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
