defmodule Kempelen.Repo.Migrations.CreateGameModifications do
  use Ecto.Migration

  def change do
    create table(:game_modifications, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :text, null: false
      add :slug, :citext, null: false
      add :change, :map, null: false, default: %{}
      add :game_id, references(:games, on_delete: :nothing, type: :binary_id), null: false

      timestamps()
    end
    create unique_index(:game_modifications, [:game_id, :slug])
    create index(:game_modifications, [:slug])
  end
end
