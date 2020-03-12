defmodule Kempelen.Models.GameTable do
  use Ecto.Schema
  import Ecto.Changeset
  import Estate, only: [state_machines: 1]

  state_machines(
    hosting_state: [
      approve: [configuring: "waiting"]
    ]
  )

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "game_tables" do
    field :name, :string
    field :slug, Kempelen.Slugs.Name.Type
    belongs_to :game, Kempelen.Models.Game, primary_key: true
    has_many :game_seats, Kempelen.Models.GameSeat
    has_many :game_rounds, Kempelen.Models.GameRound

    timestamps()
  end

  @doc false
  def changeset(record, attributes) do
    record
    |> cast(attributes, [:name])
    |> validate_required([:name])
    |> assoc_constraint(:game)
    |> Kempelen.Slugs.Name.maybe_generate_slug()
    |> Kempelen.Slugs.Name.unique_constraint()
    |> put_assoc(:game, attributes.game)
  end
end
