defmodule KempelenWeb.Graphql.Queries.GameSeat do
  use Absinthe.Schema.Notation

  object :game_seat_queries do
    @desc "Get all game_seats"
    field :game_seats, list_of(:game_seat) do

      middleware &KempelenWeb.Graphql.Middlewares.Sessions.require_authentication/2
      resolve &KempelenWeb.Graphql.Resolvers.GameSeats.list/3
    end

    @desc "Get an game_seat by id"
    field :game_seat, :game_seat do
      arg :id, non_null(:id)

      middleware &KempelenWeb.Graphql.Middlewares.Sessions.require_authentication/2
      resolve &KempelenWeb.Graphql.Resolvers.GameSeats.fetch/3
    end
  end
end
