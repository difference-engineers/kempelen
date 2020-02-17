defmodule KempelenWeb.Graphql.Schema do
  use Absinthe.Schema

  import_types Absinthe.Type.Custom
  import_types KempelenWeb.Graphql.Types.Account
  import_types KempelenWeb.Graphql.Types.GameAct
  import_types KempelenWeb.Graphql.Types.GameModification
  import_types KempelenWeb.Graphql.Types.GamePlay
  import_types KempelenWeb.Graphql.Types.GameRobot
  import_types KempelenWeb.Graphql.Types.GameRound
  import_types KempelenWeb.Graphql.Types.GameSeat
  import_types KempelenWeb.Graphql.Types.GameTable
  import_types KempelenWeb.Graphql.Types.Game
  import_types KempelenWeb.Graphql.Types.OrganizationPermission
  import_types KempelenWeb.Graphql.Types.OrganizationMembership
  import_types KempelenWeb.Graphql.Types.Permission
  import_types KempelenWeb.Graphql.Types.Organization
  import_types KempelenWeb.Graphql.Types.Session

  def middleware(middleware, _field, _object) do
    middleware ++ [Crudry.Middlewares.TranslateErrors]
  end

  query do
    @desc "Get all accounts"
    field :accounts, list_of(:account) do

      middleware &KempelenWeb.Graphql.Middlewares.Sessions.require_authentication/2
      resolve &KempelenWeb.Graphql.Resolvers.Accounts.list/3
    end

    @desc "Get an account by id"
    field :account, :account do
      arg :id, non_null(:id)

      middleware &KempelenWeb.Graphql.Middlewares.Sessions.require_authentication/2
      resolve &KempelenWeb.Graphql.Resolvers.Accounts.fetch/3
    end

    @desc "Get all game_acts"
    field :game_acts, list_of(:game_act) do

      middleware &KempelenWeb.Graphql.Middlewares.Sessions.require_authentication/2
      resolve &KempelenWeb.Graphql.Resolvers.GameActs.list/3
    end

    @desc "Get an game_act by id"
    field :game_act, :game_act do
      arg :id, non_null(:id)

      middleware &KempelenWeb.Graphql.Middlewares.Sessions.require_authentication/2
      resolve &KempelenWeb.Graphql.Resolvers.GameActs.fetch/3
    end

    @desc "Get all game_modifications"
    field :game_modifications, list_of(:game_modification) do

      middleware &KempelenWeb.Graphql.Middlewares.Sessions.require_authentication/2
      resolve &KempelenWeb.Graphql.Resolvers.GameModifications.list/3
    end

    @desc "Get an game_modification by id"
    field :game_modification, :game_modification do
      arg :id, non_null(:id)

      middleware &KempelenWeb.Graphql.Middlewares.Sessions.require_authentication/2
      resolve &KempelenWeb.Graphql.Resolvers.GameModifications.fetch/3
    end

    @desc "Get all game_plays"
    field :game_plays, list_of(:game_play) do

      middleware &KempelenWeb.Graphql.Middlewares.Sessions.require_authentication/2
      resolve &KempelenWeb.Graphql.Resolvers.GamePlays.list/3
    end

    @desc "Get an game_play by id"
    field :game_play, :game_play do
      arg :id, non_null(:id)

      middleware &KempelenWeb.Graphql.Middlewares.Sessions.require_authentication/2
      resolve &KempelenWeb.Graphql.Resolvers.GamePlays.fetch/3
    end

    @desc "Get all game_robots"
    field :game_robots, list_of(:game_robot) do

      middleware &KempelenWeb.Graphql.Middlewares.Sessions.require_authentication/2
      resolve &KempelenWeb.Graphql.Resolvers.GameRobots.list/3
    end

    @desc "Get an game_robot by id"
    field :game_robot, :game_robot do
      arg :id, non_null(:id)

      middleware &KempelenWeb.Graphql.Middlewares.Sessions.require_authentication/2
      resolve &KempelenWeb.Graphql.Resolvers.GameRobots.fetch/3
    end

    @desc "Get all game_rounds"
    field :game_rounds, list_of(:game_round) do

      middleware &KempelenWeb.Graphql.Middlewares.Sessions.require_authentication/2
      resolve &KempelenWeb.Graphql.Resolvers.GameRounds.list/3
    end

    @desc "Get an game_round by id"
    field :game_round, :game_round do
      arg :id, non_null(:id)

      middleware &KempelenWeb.Graphql.Middlewares.Sessions.require_authentication/2
      resolve &KempelenWeb.Graphql.Resolvers.GameRounds.fetch/3
    end

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

    @desc "Get all game_tables"
    field :game_tables, list_of(:game_table) do

      middleware &KempelenWeb.Graphql.Middlewares.Sessions.require_authentication/2
      resolve &KempelenWeb.Graphql.Resolvers.GameTables.list/3
    end

    @desc "Get an game_table by id"
    field :game_table, :game_table do
      arg :id, non_null(:id)

      middleware &KempelenWeb.Graphql.Middlewares.Sessions.require_authentication/2
      resolve &KempelenWeb.Graphql.Resolvers.GameTables.fetch/3
    end

    @desc "Get all games"
    field :games, list_of(:game) do

      middleware &KempelenWeb.Graphql.Middlewares.Sessions.require_authentication/2
      resolve &KempelenWeb.Graphql.Resolvers.Games.list/3
    end

    @desc "Get an game by id"
    field :game, :game do
      arg :id, non_null(:id)

      middleware &KempelenWeb.Graphql.Middlewares.Sessions.require_authentication/2
      resolve &KempelenWeb.Graphql.Resolvers.Games.fetch/3
    end

    @desc "Get all organizations"
    field :organizations, list_of(:organization) do

      middleware &KempelenWeb.Graphql.Middlewares.Sessions.require_authentication/2
      resolve &KempelenWeb.Graphql.Resolvers.Organizations.list/3
    end

    @desc "Get an organization by id"
    field :organization, :organization do
      arg :id, non_null(:id)

      middleware &KempelenWeb.Graphql.Middlewares.Sessions.require_authentication/2
      resolve &KempelenWeb.Graphql.Resolvers.Organizations.fetch/3
    end

    @desc "Get all permissions"
    field :permissions, list_of(:permission) do

      middleware &KempelenWeb.Graphql.Middlewares.Sessions.require_authentication/2
      resolve &KempelenWeb.Graphql.Resolvers.Permissions.list/3
    end

    @desc "Get an permission by id"
    field :permission, :permission do
      arg :id, non_null(:id)

      middleware &KempelenWeb.Graphql.Middlewares.Sessions.require_authentication/2
      resolve &KempelenWeb.Graphql.Resolvers.Permissions.fetch/3
    end
  end

  mutation do
    @desc "Create a new session with login credentials"
    field :create_account, :account do
      arg :name, :string
      arg :username, :string
      arg :email, non_null(:string)
      arg :password, :string

      resolve &KempelenWeb.Graphql.Resolvers.Accounts.create/3
      middleware &KempelenWeb.Graphql.Middlewares.Sessions.update_session_id/2
    end

    field :grant_administration_powers, :account do
      arg :account_id, non_null(:id)

      middleware &KempelenWeb.Graphql.Middlewares.Sessions.require_authentication/2
      resolve &KempelenWeb.Graphql.Resolvers.Accounts.grant_administration_powers/3
    end

    field :create_game_act, :game_act do
      # arg :example, :type

      middleware &KempelenWeb.Graphql.Middlewares.Sessions.require_authentication/2
      resolve &KempelenWeb.Graphql.Resolvers.GameActs.create/3
    end

    field :update_game_act, :game_act do
      arg :id, non_null(:id)
      # arg :example, :type

      middleware &KempelenWeb.Graphql.Middlewares.Sessions.require_authentication/2
      resolve &KempelenWeb.Graphql.Resolvers.GameActs.update/3
    end

    field :destroy_game_act, :game_act do
      arg :id, non_null(:id)

      middleware &KempelenWeb.Graphql.Middlewares.Sessions.require_authentication/2
      resolve &KempelenWeb.Graphql.Resolvers.GameActs.destroy/3
    end

    field :create_game_modification, :game_modification do
      # arg :example, :type

      middleware &KempelenWeb.Graphql.Middlewares.Sessions.require_authentication/2
      resolve &KempelenWeb.Graphql.Resolvers.GameModifications.create/3
    end

    field :update_game_modification, :game_modification do
      arg :id, non_null(:id)
      # arg :example, :type

      middleware &KempelenWeb.Graphql.Middlewares.Sessions.require_authentication/2
      resolve &KempelenWeb.Graphql.Resolvers.GameModifications.update/3
    end

    field :destroy_game_modification, :game_modification do
      arg :id, non_null(:id)

      middleware &KempelenWeb.Graphql.Middlewares.Sessions.require_authentication/2
      resolve &KempelenWeb.Graphql.Resolvers.GameModifications.destroy/3
    end

    field :create_game_play, :game_play do
      # arg :example, :type

      middleware &KempelenWeb.Graphql.Middlewares.Sessions.require_authentication/2
      resolve &KempelenWeb.Graphql.Resolvers.GamePlays.create/3
    end

    field :update_game_play, :game_play do
      arg :id, non_null(:id)
      # arg :example, :type

      middleware &KempelenWeb.Graphql.Middlewares.Sessions.require_authentication/2
      resolve &KempelenWeb.Graphql.Resolvers.GamePlays.update/3
    end

    field :destroy_game_play, :game_play do
      arg :id, non_null(:id)

      middleware &KempelenWeb.Graphql.Middlewares.Sessions.require_authentication/2
      resolve &KempelenWeb.Graphql.Resolvers.GamePlays.destroy/3
    end

    field :create_game_robot, :game_robot do
      # arg :example, :type

      middleware &KempelenWeb.Graphql.Middlewares.Sessions.require_authentication/2
      resolve &KempelenWeb.Graphql.Resolvers.GameRobots.create/3
    end

    field :update_game_robot, :game_robot do
      arg :id, non_null(:id)
      # arg :example, :type

      middleware &KempelenWeb.Graphql.Middlewares.Sessions.require_authentication/2
      resolve &KempelenWeb.Graphql.Resolvers.GameRobots.update/3
    end

    field :destroy_game_robot, :game_robot do
      arg :id, non_null(:id)

      middleware &KempelenWeb.Graphql.Middlewares.Sessions.require_authentication/2
      resolve &KempelenWeb.Graphql.Resolvers.GameRobots.destroy/3
    end

    field :create_game_round, :game_round do
      # arg :example, :type

      middleware &KempelenWeb.Graphql.Middlewares.Sessions.require_authentication/2
      resolve &KempelenWeb.Graphql.Resolvers.GameRounds.create/3
    end

    field :update_game_round, :game_round do
      arg :id, non_null(:id)
      # arg :example, :type

      middleware &KempelenWeb.Graphql.Middlewares.Sessions.require_authentication/2
      resolve &KempelenWeb.Graphql.Resolvers.GameRounds.update/3
    end

    field :destroy_game_round, :game_round do
      arg :id, non_null(:id)

      middleware &KempelenWeb.Graphql.Middlewares.Sessions.require_authentication/2
      resolve &KempelenWeb.Graphql.Resolvers.GameRounds.destroy/3
    end

    field :create_game_seat, :game_seat do
      # arg :example, :type

      middleware &KempelenWeb.Graphql.Middlewares.Sessions.require_authentication/2
      resolve &KempelenWeb.Graphql.Resolvers.GameSeats.create/3
    end

    field :update_game_seat, :game_seat do
      arg :id, non_null(:id)
      # arg :example, :type

      middleware &KempelenWeb.Graphql.Middlewares.Sessions.require_authentication/2
      resolve &KempelenWeb.Graphql.Resolvers.GameSeats.update/3
    end

    field :destroy_game_seat, :game_seat do
      arg :id, non_null(:id)

      middleware &KempelenWeb.Graphql.Middlewares.Sessions.require_authentication/2
      resolve &KempelenWeb.Graphql.Resolvers.GameSeats.destroy/3
    end

    field :create_game_table, :game_table do
      # arg :example, :type

      middleware &KempelenWeb.Graphql.Middlewares.Sessions.require_authentication/2
      resolve &KempelenWeb.Graphql.Resolvers.GameTables.create/3
    end

    field :update_game_table, :game_table do
      arg :id, non_null(:id)
      # arg :example, :type

      middleware &KempelenWeb.Graphql.Middlewares.Sessions.require_authentication/2
      resolve &KempelenWeb.Graphql.Resolvers.GameTables.update/3
    end

    field :destroy_game_table, :game_table do
      arg :id, non_null(:id)

      middleware &KempelenWeb.Graphql.Middlewares.Sessions.require_authentication/2
      resolve &KempelenWeb.Graphql.Resolvers.GameTables.destroy/3
    end

    field :create_game, :game do
      # arg :example, :type

      middleware &KempelenWeb.Graphql.Middlewares.Sessions.require_authentication/2
      resolve &KempelenWeb.Graphql.Resolvers.Games.create/3
    end

    field :update_game, :game do
      arg :id, non_null(:id)
      # arg :example, :type

      middleware &KempelenWeb.Graphql.Middlewares.Sessions.require_authentication/2
      resolve &KempelenWeb.Graphql.Resolvers.Games.update/3
    end

    field :destroy_game, :game do
      arg :id, non_null(:id)

      middleware &KempelenWeb.Graphql.Middlewares.Sessions.require_authentication/2
      resolve &KempelenWeb.Graphql.Resolvers.Games.destroy/3
    end

    field :create_organization, :organization do
      # arg :example, :type

      middleware &KempelenWeb.Graphql.Middlewares.Sessions.require_authentication/2
      resolve &KempelenWeb.Graphql.Resolvers.Organizations.create/3
    end

    field :update_organization, :organization do
      arg :id, non_null(:id)
      # arg :example, :type

      middleware &KempelenWeb.Graphql.Middlewares.Sessions.require_authentication/2
      resolve &KempelenWeb.Graphql.Resolvers.Organizations.update/3
    end

    field :create_permission, :permission do
      # arg :example, :type

      middleware &KempelenWeb.Graphql.Middlewares.Sessions.require_authentication/2
      resolve &KempelenWeb.Graphql.Resolvers.Permissions.create/3
    end

    field :update_permission, :permission do
      arg :id, non_null(:id)
      # arg :example, :type

      middleware &KempelenWeb.Graphql.Middlewares.Sessions.require_authentication/2
      resolve &KempelenWeb.Graphql.Resolvers.Permissions.update/3
    end

    field :destroy_permission, :permission do
      arg :id, non_null(:id)

      middleware &KempelenWeb.Graphql.Middlewares.Sessions.require_authentication/2
      resolve &KempelenWeb.Graphql.Resolvers.Permissions.destroy/3
    end

    field :create_session, :session do
      arg :email, non_null(:string)
      arg :password, non_null(:string)

      resolve &KempelenWeb.Graphql.Resolvers.Sessions.create/3
      middleware &KempelenWeb.Graphql.Middlewares.Sessions.update_session_id/2
    end

    field :destroy_session, :session do
      middleware &KempelenWeb.Graphql.Middlewares.Sessions.require_authentication/2
      resolve &KempelenWeb.Graphql.Resolvers.Sessions.create/3
      middleware &KempelenWeb.Graphql.Middlewares.Sessions.update_session_id/2
    end
  end

  subscription do
    field :account_created, :account do
      arg :id, non_null(:id)

      # The topic function is used to determine what topic a given subscription
      # cares about based on its arguments.
      config fn args, _ ->
        {:ok, topic: args.id}
      end

      # This tells Absinthe to run any subscriptions with this field every time
      # the mutation happens. It also has a topic function used to find what
      # subscriptions care about this particular comment.
      trigger :create_account, topic: fn account ->
        account.id
      end
    end
  end
end
