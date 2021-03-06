defmodule Kempelen.Repo.Migrations.CreateGamePlays do
  use Ecto.Migration

  def change do
    create table(:game_plays, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :text, null: false
      add :slug, :citext, null: false
      add :game_id, references(:games, on_delete: :nothing, type: :binary_id), null: false

      timestamps()
    end

    create unique_index(:game_plays, [:game_id, :slug])
    create index(:game_plays, [:slug])
  end
end
