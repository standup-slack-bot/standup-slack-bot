defmodule Standup.Repo.Migrations.AddUsersTableStandupsTableUserStandupsTable do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :slack_name, :string

      timestamps()
    end

    create table(:standups) do
      timestamps()
    end

    create table(:user_standups) do
      add :text, :string
      add :user_id, references(:users)
      add :standup_id, references(:standups)

      timestamps()
    end

    create index(:user_standups, [:user_id, :standup_id])
  end
end
