defmodule KempelenWeb.Graphql.Queries.GameTable do
  use Absinthe.Schema.Notation

  object :game_table_queries do
    @desc "Get all game_tables"
    field :game_tables, list_of(:game_table) do
      middleware(&KempelenWeb.Graphql.Middlewares.Sessions.require_authentication/2)
      resolve(&KempelenWeb.Graphql.Resolvers.GameTables.list/3)
    end

    @desc "Get an game_table by id"
    field :game_table, :game_table do
      arg(:id, non_null(:id))

      middleware(&KempelenWeb.Graphql.Middlewares.Sessions.require_authentication/2)
      resolve(&KempelenWeb.Graphql.Resolvers.GameTables.find/3)
    end
  end
end
