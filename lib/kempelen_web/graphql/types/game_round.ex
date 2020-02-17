defmodule KempelenWeb.Graphql.Types.GameRound do
  use Absinthe.Schema.Notation
  use Absinthe.Ecto, repo: Kempelen.Database.Repo

  object :game_round do
    field :id, non_null(:id)
    field :game_table, non_null(:game_table)
    field :inserted_at, non_null(:naive_datetime)
    field :updated_at, non_null(:naive_datetime)
  end
end
