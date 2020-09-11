defmodule DiscordElixir.MixProject do
  use Mix.Project

  def project do
    [
      app: :discord_elixir,
      version: "0.1.0",
      elixir: "~> 1.8",
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger, :discord_ex],
      mod: {DiscordElixir, []}
    ]
  end

  defp deps do
    [
      {:discord_ex, "~> 1.1.18"},
      {:hackney, "~>1.16.0", override: true}
    ]
  end
end
