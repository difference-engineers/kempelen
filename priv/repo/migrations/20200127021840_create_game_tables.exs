defmodule Kempelen.Repo.Migrations.CreateGameTablees do
  use Ecto.Migration

  def change do
    create table(:game_tables, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :text, null: false
      add :slug, :citext, null: false
      add :game_id, references(:games, on_delete: :nothing, type: :binary_id), null: false

      timestamps()
    end

    create index(:game_tables, [:game_id])
    create unique_index(:game_tables, [:game_id, :slug])
  end
end
