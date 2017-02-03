defmodule Standup.Bot do
  use Slack

  def handle_connect(slack, state) do
    {:ok, state}
  end

  # ignore certain messages
  def handle_event(%{type: "message", subtype: _}, _slack), do: :ok
  def handle_event(%{type: "message", reply_to: _}, _slack), do: :ok
  def handle_event(%{type: "message"} = message, slack, state) do
    if direct_message?(message, slack) do
      send_message("this is a dm!", message.channel, slack)
    else
      send_message("this isn't a dm!", message.channel, slack)
    end

    {:ok, state}
  end
  def handle_event(_, _, state), do: {:ok, state}

  def handle_info({:message, text, channel}, slack, state) do
    IO.puts "Sending your message, captain!"

    send_message(text, channel, slack)

    {:ok, state}
  end
  def handle_info(_, _, state), do: {:ok, state}

  defp direct_message?(%{channel: channel}, slack) do
    Map.has_key?(slack.ims, channel)
  end
end
