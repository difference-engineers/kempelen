defmodule KempelenWeb.Graphql.Mutations.GameRound do
  use Absinthe.Schema.Notation

  object :game_round_mutations do
    @desc "Create a new game_round"
    field :create_game_round, :game_round do
      # arg :example, :type
      middleware(&KempelenWeb.Graphql.Middlewares.Sessions.require_authentication/2)
      resolve(&KempelenWeb.Graphql.Resolvers.GameRounds.create/3)
    end

    @desc "Update an existing game_round"
    field :update_game_round, :game_round do
      arg(:input, non_null(:id))

      # arg :example, :type

      middleware(&KempelenWeb.Graphql.Middlewares.Sessions.require_authentication/2)
      resolve(&KempelenWeb.Graphql.Resolvers.GameRounds.update/3)
    end

    @desc "Permanently delete an existing game_round"
    field :destroy_game_round, :game_round do
      arg(:input, non_null(:id))

      middleware(&KempelenWeb.Graphql.Middlewares.Sessions.require_authentication/2)
      resolve(&KempelenWeb.Graphql.Resolvers.GameRounds.destroy/3)
    end
  end
end
