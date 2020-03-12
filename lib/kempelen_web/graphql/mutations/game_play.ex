defmodule KempelenWeb.Graphql.Mutations.GamePlay do
  use Absinthe.Schema.Notation

  object :game_play_mutations do
    @desc "Create a new game_play"
    field :create_game_play, :game_play do
      # arg :example, :type
      middleware(&KempelenWeb.Graphql.Middlewares.Sessions.require_authentication/2)
      resolve(&KempelenWeb.Graphql.Resolvers.GamePlays.create/3)
    end

    @desc "Update an existing game_play"
    field :update_game_play, :game_play do
      arg(:input, non_null(:id))

      # arg :example, :type

      middleware(&KempelenWeb.Graphql.Middlewares.Sessions.require_authentication/2)
      resolve(&KempelenWeb.Graphql.Resolvers.GamePlays.update/3)
    end

    @desc "Permanently delete an existing game_play"
    field :destroy_game_play, :game_play do
      arg(:input, non_null(:id))

      middleware(&KempelenWeb.Graphql.Middlewares.Sessions.require_authentication/2)
      resolve(&KempelenWeb.Graphql.Resolvers.GamePlays.destroy/3)
    end
  end
end
