defmodule KempelenWeb.Graphql.Schema do
  use Absinthe.Schema

  import_types(Absinthe.Type.Custom)
  import_types(KempelenWeb.Graphql.Types.{
    Account,
    GameEvent,
    GameModification,
    GamePlay,
    GameRobot,
    GameRound,
    GameSeat,
    GameTable,
    Game,
    OrganizationPermission,
    OrganizationMembership,
    Permission,
    Organization,
    Session
  })
  import_types(KempelenWeb.Graphql.Queries.{
    Account,
    GameEvent,
    GameModification,
    GamePlay,
    GameRobot,
    GameRound,
    GameSeat,
    GameTable,
    Game,
    Permission,
    Organization,
    Session
  })
  import_types(KempelenWeb.Graphql.Mutations.{
    Account,
    GameEvent,
    GameModification,
    GamePlay,
    GameRobot,
    GameRound,
    GameSeat,
    GameTable,
    Game,
    Permission,
    Organization,
    Session
  })
  import_types(KempelenWeb.Graphql.Subscriptions.{
    Account,
    GameEvent,
    GameModification,
    GamePlay,
    GameRobot,
    GameRound,
    GameSeat,
    GameTable,
    Game,
    Permission,
    Organization,
    Session
  })

  def middleware(middleware, _field, _object) do
    middleware ++ [Crudry.Middlewares.TranslateErrors]
  end

  query do
    import_fields(:account_queries)
    import_fields(:game_event_queries)
    import_fields(:game_modification)
    import_fields(:game_play_queries)
    import_fields(:game_robot_queries)
    import_fields(:game_round_queries)
    import_fields(:game_seat_queries)
    import_fields(:game_table_queries)
    import_fields(:game_queries)
    import_fields(:permission_queries)
    import_fields(:organization_queries)
    import_fields(:session_queries)

  end

  mutation do
    import_fields(:account_mutations)
    import_fields(:game_event_mutations)
    import_fields(:game_modification)
    import_fields(:game_play_mutations)
    import_fields(:game_robot_mutations)
    import_fields(:game_round_mutations)
    import_fields(:game_seat_mutations)
    import_fields(:game_table_mutations)
    import_fields(:game_mutations)
    import_fields(:permission_mutations)
    import_fields(:organization_mutations)
    import_fields(:session_mutations)
  end

  subscription do
    import_fields(:account_subscriptions)
    import_fields(:game_event_subscriptions)
    import_fields(:game_modification)
    import_fields(:game_play_subscriptions)
    import_fields(:game_robot_subscriptions)
    import_fields(:game_round_subscriptions)
    import_fields(:game_seat_subscriptions)
    import_fields(:game_table_subscriptions)
    import_fields(:game_subscriptions)
    import_fields(:permission_subscriptions)
    import_fields(:organization_subscriptions)
    import_fields(:session_subscriptions)
  end
end
