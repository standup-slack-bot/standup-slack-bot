defmodule Standup.User do
  use Ecto.Schema

  schema "users" do
    field :slack_name, :string

    many_to_many :standups, StandupRecord, join_through: UserStandup

    timestamps
  end
end
