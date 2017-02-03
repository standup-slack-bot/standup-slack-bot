defmodule Standup.StandupRecord do
  use Ecto.Schema

  schema "standups" do
    many_to_many :users, User, join_through: UserStandup

    timestamps
  end
end
