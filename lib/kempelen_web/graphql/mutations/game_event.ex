defmodule KempelenWeb.Graphql.Mutations.GameEvent do
  use Absinthe.Schema.Notation

  object :game_event_mutations do
    @desc "Create a new game_event"
    field :create_game_event, :game_event do
      # arg :example, :type

      middleware &KempelenWeb.Graphql.Middlewares.Sessions.require_authentication/2
      resolve &KempelenWeb.Graphql.Resolvers.GameEvents.create/3
    end

    @desc "Update an existing game_event"
    field :update_game_event, :game_event do
      arg :id, non_null(:id)
      # arg :example, :type

      middleware &KempelenWeb.Graphql.Middlewares.Sessions.require_authentication/2
      resolve &KempelenWeb.Graphql.Resolvers.GameEvents.update/3
    end

    @desc "Permanently delete an existing game_event"
    field :destroy_game_event, :game_event do
      arg :id, non_null(:id)

      middleware &KempelenWeb.Graphql.Middlewares.Sessions.require_authentication/2
      resolve &KempelenWeb.Graphql.Resolvers.GameEvents.destroy/3
    end
  end
end
