defmodule Kempelen.Models.GamePlay do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "game_plays" do
    field :name, :string
    field :slug, Kempelen.Slugs.Name.Type
    belongs_to :game, Kempelen.Models.Game, primary_key: true

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
