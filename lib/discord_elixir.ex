defmodule DiscordElixir do
  @moduledoc """
  Documentation for DiscordElixir.
  """

  def start(_type, _args) do
    import Supervisor.Spec

    children = [
      worker(DiscordElixir.Manager.Worker, [%{
        handler: DiscordElixir.Manager.Worker,
        token: Application.get_env(:discord_elixir, :token)
      }])
    ]

    opts = [strategy: :one_for_one, name: DiscordElixir.Supervisor]
    Supervisor.start_link(children, opts)
  end

end
