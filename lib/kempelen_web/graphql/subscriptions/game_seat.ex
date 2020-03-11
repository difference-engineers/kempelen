defmodule KempelenWeb.Graphql.Subscriptions.GameSeat do
  use Absinthe.Schema.Notation

  object :game_seat_subscriptions do
    @desc "When a new game_seat is created"
    field :game_seat_created, :game_seat do
      arg :id, non_null(:id)

      # The topic function is used to determine what topic a given subscription
      # cares about based on its arguments.
      config fn args, _ ->
        {:ok, topic: args.id}
      end

      # This tells Absinthe to run any subscriptions with this field every time
      # the mutation happens. It also has a topic function used to find what
      # subscriptions care about this particular comment.
      trigger :create_game_seat, topic: fn game_seat ->
        game_seat.id
      end
    end
  end
end
