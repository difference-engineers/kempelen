defmodule KempelenWeb.Graphql.Subscriptions.GameRobot do
  use Absinthe.Schema.Notation

  object :game_robot_subscriptions do
    @desc "When a new game_robot is created"
    field :game_robot_created, :game_robot do
      arg(:id, non_null(:id))

      # The topic function is used to determine what topic a given subscription
      # cares about based on its arguments.
      config(fn args, _ ->
        {:ok, topic: args.id}
      end)

      # This tells Absinthe to run any subscriptions with this field every time
      # the mutation happens. It also has a topic function used to find what
      # subscriptions care about this particular comment.
      trigger(:create_game_robot,
        topic: fn game_robot ->
          game_robot.id
        end
      )
    end
  end
end
