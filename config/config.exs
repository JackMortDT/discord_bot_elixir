use Mix.Config

config :logger, level: :info
config :discord_elixir, token: System.get_env("DISCORD_TOKEN")
config :discord_elixir, discord_prefix: "!"
