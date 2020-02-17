defmodule Kempelen.Models.Game do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "games" do
    field :name, :string
    field :slug, Kempelen.Slugs.Name.Type
    belongs_to :organization, Kempelen.Models.Organization, primary_key: true
    has_many :game_tables, Kempelen.Models.GameTable
    has_many :game_plays, Kempelen.Models.GamePlay
    has_many :game_modifications, Kempelen.Models.GameModification

    timestamps()
  end

  @doc false
def changeset(record, attributes) do
    record
    |> cast(attributes, [:name])
    |> validate_required([:name])
    |> assoc_constraint(:organization)
    |> Kempelen.Slugs.Name.maybe_generate_slug
    |> Kempelen.Slugs.Name.unique_constraint
    |> put_assoc(:organization, attributes.organization)
  end
end
