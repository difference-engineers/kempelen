defmodule Kempelen.Repo.Migrations.CreateGameSeats do
  use Ecto.Migration

  def change do
    create table(:game_seats, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :text, null: false
      add :slug, :citext, null: false
      add :host, :boolean, null: false, default: false

      add :game_table_id, references(:game_tables, on_delete: :nothing, type: :binary_id),
        null: false

      add :account_id, references(:accounts, on_delete: :nothing, type: :binary_id)
      add :game_robot_id, references(:game_robots, on_delete: :nothing, type: :binary_id)

      timestamps()
    end

    create index(:game_seats, [:account_id])
    create index(:game_seats, [:game_robot_id])
    create unique_index(:game_seats, [:game_table_id, :slug])
    create index(:game_seats, [:slug])
  end
end
