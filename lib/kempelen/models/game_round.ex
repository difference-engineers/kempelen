defmodule Kempelen.Models.GameRound do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "game_rounds" do
    belongs_to :game_table, Kempelen.Models.GameTable, primary_key: true
    has_many :game_acts, Kempelen.Models.GameAct

    timestamps()
  end

  @doc false
  def changeset(record, attributes) do
    record
    |> cast(attributes, [])
    |> validate_required([])
    |> assoc_constraint(:game_table)
    |> put_assoc(:game_table, attributes.game_table)
  end
end
