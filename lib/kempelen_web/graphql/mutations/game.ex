defmodule KempelenWeb.Graphql.Mutations.Game do
  use Absinthe.Schema.Notation

  object :game_mutations do
    @desc "Create a new game"
    field :create_game, :game do
      # arg :example, :type
      middleware(&KempelenWeb.Graphql.Middlewares.Sessions.require_authentication/2)
      resolve(&KempelenWeb.Graphql.Resolvers.Games.create/3)
    end

    @desc "Update an existing game"
    field :update_game, :game do
      arg(:input, non_null(:id))

      # arg :example, :type

      middleware(&KempelenWeb.Graphql.Middlewares.Sessions.require_authentication/2)
      resolve(&KempelenWeb.Graphql.Resolvers.Games.update/3)
    end

    @desc "Permanently delete an existing game"
    field :destroy_game, :game do
      arg(:input, non_null(:id))

      middleware(&KempelenWeb.Graphql.Middlewares.Sessions.require_authentication/2)
      resolve(&KempelenWeb.Graphql.Resolvers.Games.destroy/3)
    end
  end
end
