defmodule KempelenWeb.Graphql.Subscriptions.GameModification do
  use Absinthe.Schema.Notation

  object :game_modification_subscriptions do
    @desc "When a new game_modification is created"
    field :game_modification_created, :game_modification do
      arg :id, non_null(:id)

      # The topic function is used to determine what topic a given subscription
      # cares about based on its arguments.
      config fn args, _ ->
        {:ok, topic: args.id}
      end

      # This tells Absinthe to run any subscriptions with this field every time
      # the mutation happens. It also has a topic function used to find what
      # subscriptions care about this particular comment.
      trigger :create_game_modification, topic: fn game_modification ->
        game_modification.id
      end
    end
  end
end
