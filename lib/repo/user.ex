defmodule Standup.Repo.User do
  use Ecto.Schema
  alias Standup.Repo.{StandupRecord, UserStandup}

  schema "users" do
    field :slack_name, :string
    field :slack_id, :string
    many_to_many :standups, StandupRecord, join_through: UserStandup

    timestamps
  end
end
