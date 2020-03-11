defmodule KempelenWeb.Graphql.Mutations.GameSeat do
  use Absinthe.Schema.Notation

  object :game_seat_mutations do
    @desc "Create a new game_seat"
    field :create_game_seat, :game_seat do
      # arg :example, :type
      middleware &KempelenWeb.Graphql.Middlewares.Sessions.require_authentication/2
      resolve &KempelenWeb.Graphql.Resolvers.GameSeats.create/3
    end

    @desc "Update an existing game_seat"
    field :update_game_seat, :game_seat do
      arg :id, non_null(:id)
      # arg :example, :type

      middleware &KempelenWeb.Graphql.Middlewares.Sessions.require_authentication/2
      resolve &KempelenWeb.Graphql.Resolvers.GameSeats.update/3
    end

    @desc "Permanently delete an existing game_seat"
    field :destroy_game_seat, :game_seat do
      arg :id, non_null(:id)

      middleware &KempelenWeb.Graphql.Middlewares.Sessions.require_authentication/2
      resolve &KempelenWeb.Graphql.Resolvers.GameSeats.destroy/3
    end
  end
end
