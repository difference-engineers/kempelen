defmodule KempelenWeb.Graphql.Queries.GameRobot do
  use Absinthe.Schema.Notation

  object :game_robot_queries do
    @desc "Get all game_robots"
    field :game_robots, list_of(:game_robot) do
      middleware(&KempelenWeb.Graphql.Middlewares.Sessions.require_authentication/2)
      resolve(&KempelenWeb.Graphql.Resolvers.GameRobots.list/3)
    end

    @desc "Get an game_robot by id"
    field :game_robot, :game_robot do
      arg(:id, non_null(:id))

      middleware(&KempelenWeb.Graphql.Middlewares.Sessions.require_authentication/2)
      resolve(&KempelenWeb.Graphql.Resolvers.GameRobots.find/3)
    end
  end
end
