defmodule KempelenWeb.Graphql.Subscriptions.GameRound do
  use Absinthe.Schema.Notation

  object :game_round_subscriptions do
    @desc "When a new game_round is created"
    field :game_round_created, :game_round do
      arg(:id, non_null(:id))

      # The topic function is used to determine what topic a given subscription
      # cares about based on its arguments.
      config(fn args, _ ->
        {:ok, topic: args.id}
      end)

      # This tells Absinthe to run any subscriptions with this field every time
      # the mutation happens. It also has a topic function used to find what
      # subscriptions care about this particular comment.
      trigger(:create_game_round,
        topic: fn game_round ->
          game_round.id
        end
      )
    end
  end
end
