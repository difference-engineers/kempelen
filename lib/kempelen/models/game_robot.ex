defmodule Kempelen.Models.GameRobot do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "game_robots" do
    field :name, :string
    field :slug, Kempelen.Slugs.Name.Type
    belongs_to :game, Kempelen.Models.Game, primary_key: true
    has_many :game_seats, Kempelen.Models.GameSeat
    has_many :game_tables, through: [:game_seats, :game_table]

    timestamps()
  end

  @doc false
  def changeset(record, attributes) do
    record
    |> cast(attributes, [:name])
    |> validate_required([:name])
    |> Kempelen.Slugs.Name.maybe_generate_slug()
    |> Kempelen.Slugs.Name.unique_constraint()
    |> put_assoc(:game, attributes.game)
  end
end
