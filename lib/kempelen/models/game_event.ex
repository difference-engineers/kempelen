defmodule Kempelen.Models.GameEvent do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "game_events" do
    belongs_to :game_play, Kempelen.Models.GamePlay, primary_key: true
    belongs_to :game_seat, Kempelen.Models.GameSeat, primary_key: true
    belongs_to :game_round, Kempelen.Models.GameRound, primary_key: true

    timestamps()
  end

  @doc false
  def changeset(record, attributes) do
    record
    |> cast(attributes, [])
    |> validate_required([])
    |> assoc_constraint(:game_play)
    |> assoc_constraint(:game_seat)
    |> assoc_constraint(:game_round)
    |> put_assoc(:game_play, attributes.game_play)
    |> put_assoc(:game_seat, attributes.game_seat)
    |> put_assoc(:game_round, attributes.game_round)
  end
end
