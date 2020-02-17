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
  end

  mutation do
    @desc "Create a new session with login credentials"
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
