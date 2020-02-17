defmodule KempelenWeb.Graphql.Types.GameSeat do
  use Absinthe.Schema.Notation
  use Absinthe.Ecto, repo: Kempelen.Database.Repo

  object :game_seat do
    field :id, non_null(:id)
    field :name, non_null(:string)
    field :slug, non_null(:string)
    field :inserted_at, non_null(:naive_datetime)
    field :updated_at, non_null(:naive_datetime)
  end
end
