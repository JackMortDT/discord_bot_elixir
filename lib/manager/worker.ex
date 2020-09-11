defmodule DiscordElixir.Manager.Worker do
  @moduledoc false
  require Logger

  alias DiscordElixir.Util.ProcessMessageUtil
  alias DiscordEx.Client

  def start_link(otps \\ [] ) do
    Client.start_link(otps)
  end

  def handle_event({:message_create, payload}, state) do
    Logger.info("Author: #{payload.data["author"]["username"]} ")
    if !payload.data["author"]["bot"] do
      Task.start(fn -> ProcessMessageUtil.process_message(payload, state) end)
    end
    {:ok, state}
  end

  def handle_event({_event, _payload}, state) do
    {:ok, state}
  end

end
