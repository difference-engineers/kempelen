defmodule KempelenWeb.Graphql.Types.Account do
  use Absinthe.Schema.Notation
  use Absinthe.Ecto, repo: Kempelen.Database.Repo

  object :account do
    field :id, non_null(:id)
    field :email, non_null(:string)
    field :name, :string
    field :username, :string
    field :organizations, list_of(:organization)
    field :game_seats, list_of(:game_seat)
    field :game_tables, list_of(:game_table)
    field :game_rounds, list_of(:game_round)
    field :inserted_at, non_null(:naive_datetime)
    field :updated_at, non_null(:naive_datetime)
  end
end
