defmodule KempelenWeb.Graphql.Queries.GameModification do
  use Absinthe.Schema.Notation

  object :game_modification_queries do
    @desc "Get all game_modifications"
    field :game_modifications, list_of(:game_modification) do

      middleware &KempelenWeb.Graphql.Middlewares.Sessions.require_authentication/2
      resolve &KempelenWeb.Graphql.Resolvers.GameModifications.list/3
    end

    @desc "Get an game_modification by id"
    field :game_modification, :game_modification do
      arg :id, non_null(:id)

      middleware &KempelenWeb.Graphql.Middlewares.Sessions.require_authentication/2
      resolve &KempelenWeb.Graphql.Resolvers.GameModifications.fetch/3
    end
  end
end
