defmodule KempelenWeb.Graphql.Queries.GameRound do
  use Absinthe.Schema.Notation

  object :game_round_queries do
    @desc "Get all game_rounds"
    field :game_rounds, list_of(:game_round) do
      middleware(&KempelenWeb.Graphql.Middlewares.Sessions.require_authentication/2)
      resolve(&KempelenWeb.Graphql.Resolvers.GameRounds.list/3)
    end

    @desc "Get an game_round by id"
    field :game_round, :game_round do
      arg(:id, non_null(:id))

      middleware(&KempelenWeb.Graphql.Middlewares.Sessions.require_authentication/2)
      resolve(&KempelenWeb.Graphql.Resolvers.GameRounds.find/3)
    end
  end
end
