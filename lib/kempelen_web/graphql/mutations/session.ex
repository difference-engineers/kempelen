defmodule KempelenWeb.Graphql.Mutations.Session do
  use Absinthe.Schema.Notation

  object :session_mutations do
    @desc "Create a new session"
    field :create_session, :session do
      arg(:email, non_null(:string))
      arg(:password, non_null(:string))

      resolve(&KempelenWeb.Graphql.Resolvers.Sessions.create/3)
      middleware(&KempelenWeb.Graphql.Middlewares.Sessions.update_session_id/2)
    end

    @desc "Permanently delete an existing session"
    field :destroy_session, :session do
      middleware(&KempelenWeb.Graphql.Middlewares.Sessions.require_authentication/2)
      resolve(&KempelenWeb.Graphql.Resolvers.Sessions.create/3)
      middleware(&KempelenWeb.Graphql.Middlewares.Sessions.update_session_id/2)
    end
  end
end
