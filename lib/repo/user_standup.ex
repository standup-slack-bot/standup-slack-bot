defmodule Standup.UserStandup do
  use Ecto.Schema

  schema "user_standups" do
    field :text, :string
    belongs_to :user, User
    belongs_to :standup, StandupRecord

    timestamps
  end
end
