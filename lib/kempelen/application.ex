defmodule Kempelen.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    unless Mix.env == :prod do
      Envy.auto_load
    end

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    Supervisor.start_link([
      # Start the Ecto repository
      Kempelen.Database.Repo,
      # Start the endpoint when the application starts
      KempelenWeb.Endpoint,
      # Starts a worker by calling: Kempelen.Worker.start_link(arg)
      # {Kempelen.Worker, arg},
      {Oban, Application.get_env(:kempelen, Oban)},
      {Absinthe.Subscription, [KempelenWeb.Endpoint]}
    ], strategy: :one_for_one, name: Kempelen.Supervisor)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    KempelenWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
