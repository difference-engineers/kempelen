defmodule KempelenWeb.Graphql.Mutations.GameRobot do
  use Absinthe.Schema.Notation

  object :game_robot_mutations do
    @desc "Create a new game_robot"
    field :create_game_robot, :game_robot do
      # arg :example, :type
      middleware(&KempelenWeb.Graphql.Middlewares.Sessions.require_authentication/2)
      resolve(&KempelenWeb.Graphql.Resolvers.GameRobots.create/3)
    end

    @desc "Update an existing game_robot"
    field :update_game_robot, :game_robot do
      arg(:input, non_null(:id))

      # arg :example, :type

      middleware(&KempelenWeb.Graphql.Middlewares.Sessions.require_authentication/2)
      resolve(&KempelenWeb.Graphql.Resolvers.GameRobots.update/3)
    end

    @desc "Permanently delete an existing game_robot"
    field :destroy_game_robot, :game_robot do
      arg(:input, non_null(:id))

      middleware(&KempelenWeb.Graphql.Middlewares.Sessions.require_authentication/2)
      resolve(&KempelenWeb.Graphql.Resolvers.GameRobots.destroy/3)
    end
  end
end
