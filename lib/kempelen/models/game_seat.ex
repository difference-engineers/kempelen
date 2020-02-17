defmodule Kempelen.Models.GameSeat do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "game_seats" do
    field :name, :string
    field :slug, Kempelen.Slugs.Name.Type
    field :host, :boolean, default: false
    belongs_to :game_table, Kempelen.Models.GameTable, primary_key: true
    belongs_to :account, Kempelen.Models.Account
    belongs_to :game_robot, Kempelen.Models.GameRobot
    has_many :game_acts, Kempelen.Models.GameAct

    timestamps()
  end

  @doc false
  def changeset(record, attributes) do
    record
      |> cast(attributes, [:name, :host])
      |> validate_required([:name, :host])
      |> assoc_constraint(:game_table)
      |> assoc_constraint(:account)
      |> assoc_constraint(:game_robot)
      |> Kempelen.Slugs.Name.maybe_generate_slug
      |> Kempelen.Slugs.Name.unique_constraint
      |> put_assoc(:game_robot, attributes[:game_robot])
      |> put_assoc(:account, attributes[:account])
      |> put_assoc(:game_table, attributes.game_table)
  end
end
