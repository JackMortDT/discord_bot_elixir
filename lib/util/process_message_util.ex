defmodule DiscordElixir.Util.ProcessMessageUtil do
  @moduledoc false
  require Logger
  alias DiscordEx.Client.Helpers.MessageHelper
  alias DiscordEx.RestClient.Resources.Channel

  def process_message(payload, state) do
    prefix = Application.get_env(:discord_elixir, :discord_prefix)
    parsed_cmd = MessageHelper.msg_command_parse(payload, prefix)
    process_command(parsed_cmd, payload, state)
  end

  def process_command({"hello", _}, payload, state) do
    msg = "Hello #{payload.data["author"]["username"]} 🦎"
    send_message(msg, payload, state)
  end

  def process_command({"info", _}, payload, state) do
    msg = "Hi my name is Jackbot, I am a example bot made with Elixir and discord_ex"
    send_message(msg, payload, state)
  end

  def process_command(_, _payload, _state) do
    :noop
  end

  defp send_message(msg, payload, state) do
    Channel.send_message(state[:rest_client], payload.data["channel_id"], %{content: msg})
  end

end
