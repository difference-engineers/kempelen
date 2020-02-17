defmodule Kempelen.Models.GameModification do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "game_modifications" do
    field :name, :string
    field :slug, Kempelen.Slugs.Name.Type
    field :change, :map
    belongs_to :game, Kempelen.Models.Game, primary_key: true

    timestamps()
  end

  @doc false
  def changeset(record, attributes) do
    record
    |> cast(attributes, [:name, :change])
    |> validate_required([:name, :change])
    |> assoc_constraint(:game)
    |> Kempelen.Slugs.Name.maybe_generate_slug
    |> Kempelen.Slugs.Name.unique_constraint
    |> put_assoc(:game, attributes.game)
  end
end
