defmodule Standup.Bot do
  use Slack
  alias Standup.{Repo}

  def handle_connect(slack, state) do
    {:ok, state}
  end

  # ignore certain messages
  def handle_event(%{type: "message", subtype: _}, _slack), do: :ok
  def handle_event(%{type: "message", reply_to: _}, _slack), do: :ok
  def handle_event(%{type: "message"} = message, slack, state) do
    if direct_message?(message, slack) do
      handle_direct_message(message, slack)
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

  defp handle_error(_), do: :ok

  defp direct_message?(%{channel: channel}, slack) do
    Map.has_key?(slack.ims, channel)
  end

  defp handle_direct_message(message, slack) do
    with :ok <- save_standup(message) do
      send_message("Thank you! I saved your standup", message.channel, slack)
    else
      {:error, reason} -> handle_error(reason)
    end
  end

  defp save_standup(message) do
    Repo.create_or_update_standup(%{user: "hi", standup: "hi"})
  end
end
