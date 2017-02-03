defmodule Standup.Repo.UserStandup do
  use Ecto.Schema
  alias Standup.Repo.{User, StandupRecord}

  schema "user_standups" do
    field :text, :string
    belongs_to :user, User
    belongs_to :standup, StandupRecord

    timestamps
  end
end
