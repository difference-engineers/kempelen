defmodule KempelenWeb.Graphql.Mutations.GameTable do
  use Absinthe.Schema.Notation

  object :game_table_mutations do
    @desc "Create a new game_table"
    field :create_game_table, :game_table do
      # arg :example, :type
      middleware &KempelenWeb.Graphql.Middlewares.Sessions.require_authentication/2
      resolve &KempelenWeb.Graphql.Resolvers.GameTables.create/3
    end

    @desc "Update an existing game_table"
    field :update_game_table, :game_table do
      arg :id, non_null(:id)
      # arg :example, :type

      middleware &KempelenWeb.Graphql.Middlewares.Sessions.require_authentication/2
      resolve &KempelenWeb.Graphql.Resolvers.GameTables.update/3
    end

    @desc "Permanently delete an existing game_table"
    field :destroy_game_table, :game_table do
      arg :id, non_null(:id)

      middleware &KempelenWeb.Graphql.Middlewares.Sessions.require_authentication/2
      resolve &KempelenWeb.Graphql.Resolvers.GameTables.destroy/3
    end
  end
end
