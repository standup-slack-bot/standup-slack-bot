defmodule Standup.Repo do
  use Ecto.Repo, otp_app: :standup

  def create_or_update_standup(%{user: user, standup: standup}) do
    :ok
  end
end
