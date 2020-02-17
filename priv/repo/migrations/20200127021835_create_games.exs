defmodule Kempelen.Repo.Migrations.CreateGames do
  use Ecto.Migration

  def change do
    create table(:games, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :text, null: false
      add :slug, :citext, null: false
      add :organization_id, references(:organizations, on_delete: :nothing, type: :binary_id), null: false

      timestamps()
    end

    create unique_index(:games, [:slug])
    create index(:games, [:organization_id])
  end
end
