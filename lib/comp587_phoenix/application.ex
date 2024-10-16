defmodule Comp587Phoenix.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      Comp587PhoenixWeb.Telemetry,
      {DNSCluster, query: Application.get_env(:comp587_phoenix, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Comp587Phoenix.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Comp587Phoenix.Finch},
      # Start a worker by calling: Comp587Phoenix.Worker.start_link(arg)
      # {Comp587Phoenix.Worker, arg},
      # Start to serve requests, typically the last entry
      Comp587PhoenixWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Comp587Phoenix.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    Comp587PhoenixWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
