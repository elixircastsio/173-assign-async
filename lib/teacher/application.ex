defmodule Teacher.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      TeacherWeb.Telemetry,
      Teacher.Repo,
      {DNSCluster, query: Application.get_env(:teacher, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Teacher.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Teacher.Finch},
      # Start a worker by calling: Teacher.Worker.start_link(arg)
      # {Teacher.Worker, arg},
      # Start to serve requests, typically the last entry
      TeacherWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Teacher.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    TeacherWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
