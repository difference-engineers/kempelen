defmodule Kempelen.Repo.Migrations.CreateGameRounds do
  use Ecto.Migration

  def change do
    create table(:game_rounds, primary_key: false) do
      add :id, :binary_id, primary_key: true

      add :game_table_id, references(:game_tables, on_delete: :nothing, type: :binary_id),
        null: false

      timestamps()
    end

    create index(:game_rounds, [:game_table_id])
  end
end
