defmodule Standup.Repo.StandupRecord do
  use Ecto.Schema
  alias Standup.Repo.{User, UserStandup}

  schema "standups" do
    many_to_many :users, User, join_through: UserStandup

    timestamps
  end
end
