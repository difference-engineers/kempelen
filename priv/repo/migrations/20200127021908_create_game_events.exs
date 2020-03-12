defmodule Kempelen.Repo.Migrations.CreateGameAccountActs do
  use Ecto.Migration

  def change do
    create table(:game_events, primary_key: false) do
      add :id, :binary_id, primary_key: true

      add :game_play_id, references(:game_plays, on_delete: :nothing, type: :binary_id),
        null: false

      add :game_round_id, references(:game_rounds, on_delete: :nothing, type: :binary_id),
        null: false

      add :game_seat_id, references(:game_seats, on_delete: :nothing, type: :binary_id),
        null: false

      timestamps()
    end

    create index(:game_events, [:game_play_id])
    create index(:game_events, [:game_round_id])
    create index(:game_events, [:game_seat_id])
  end
end
