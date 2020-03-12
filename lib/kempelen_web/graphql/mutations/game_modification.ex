defmodule KempelenWeb.Graphql.Mutations.GameModification do
  use Absinthe.Schema.Notation

  object :game_modification_mutations do
    @desc "Create a new game_modification"
    field :create_game_modification, :game_modification do
      # arg :example, :type
      middleware(&KempelenWeb.Graphql.Middlewares.Sessions.require_authentication/2)
      resolve(&KempelenWeb.Graphql.Resolvers.GameModifications.create/3)
    end

    @desc "Update an existing game_modification"
    field :update_game_modification, :game_modification do
      arg(:input, non_null(:id))

      # arg :example, :type

      middleware(&KempelenWeb.Graphql.Middlewares.Sessions.require_authentication/2)
      resolve(&KempelenWeb.Graphql.Resolvers.GameModifications.update/3)
    end

    @desc "Permanently delete an existing game_modification"
    field :destroy_game_modification, :game_modification do
      arg(:input, non_null(:id))

      middleware(&KempelenWeb.Graphql.Middlewares.Sessions.require_authentication/2)
      resolve(&KempelenWeb.Graphql.Resolvers.GameModifications.destroy/3)
    end
  end
end
