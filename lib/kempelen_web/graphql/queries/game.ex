defmodule KempelenWeb.Graphql.Queries.Game do
  use Absinthe.Schema.Notation

  object :game_queries do
    @desc "Get all games"
    field :games, list_of(:game) do

      middleware &KempelenWeb.Graphql.Middlewares.Sessions.require_authentication/2
      resolve &KempelenWeb.Graphql.Resolvers.Games.list/3
    end

    @desc "Get an game by id"
    field :game, :game do
      arg :id, non_null(:id)

      middleware &KempelenWeb.Graphql.Middlewares.Sessions.require_authentication/2
      resolve &KempelenWeb.Graphql.Resolvers.Games.fetch/3
    end
  end
end
