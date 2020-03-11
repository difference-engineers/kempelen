defmodule KempelenWeb.Graphql.Queries.GameEvent do
  use Absinthe.Schema.Notation

  object :game_event_queries do
    @desc "Get all game_events"
    field :game_events, list_of(:game_event) do

      middleware &KempelenWeb.Graphql.Middlewares.Sessions.require_authentication/2
      resolve &KempelenWeb.Graphql.Resolvers.GameEvents.list/3
    end

    @desc "Get an game_event by id"
    field :game_event, :game_event do
      arg :id, non_null(:id)

      middleware &KempelenWeb.Graphql.Middlewares.Sessions.require_authentication/2
      resolve &KempelenWeb.Graphql.Resolvers.GameEvents.fetch/3
    end
  end
end
