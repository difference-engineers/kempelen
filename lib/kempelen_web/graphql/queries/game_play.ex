defmodule KempelenWeb.Graphql.Queries.GamePlay do
  use Absinthe.Schema.Notation

  object :game_play_queries do
    @desc "Get all game_plays"
    field :game_plays, list_of(:game_play) do
      middleware(&KempelenWeb.Graphql.Middlewares.Sessions.require_authentication/2)
      resolve(&KempelenWeb.Graphql.Resolvers.GamePlays.list/3)
    end

    @desc "Get an game_play by id"
    field :game_play, :game_play do
      arg(:id, non_null(:id))

      middleware(&KempelenWeb.Graphql.Middlewares.Sessions.require_authentication/2)
      resolve(&KempelenWeb.Graphql.Resolvers.GamePlays.find/3)
    end
  end
end
