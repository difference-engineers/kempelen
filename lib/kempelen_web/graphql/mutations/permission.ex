defmodule KempelenWeb.Graphql.Mutations.Permission do
  use Absinthe.Schema.Notation

  object :permission_mutations do
    @desc "Create a new permission"
    field :create_permission, :permission do
      # arg :example, :type
      middleware(&KempelenWeb.Graphql.Middlewares.Sessions.require_authentication/2)
      resolve(&KempelenWeb.Graphql.Resolvers.Permissions.create/3)
    end

    @desc "Update an existing permission"
    field :update_permission, :permission do
      arg(:input, non_null(:id))

      # arg :example, :type

      middleware(&KempelenWeb.Graphql.Middlewares.Sessions.require_authentication/2)
      resolve(&KempelenWeb.Graphql.Resolvers.Permissions.update/3)
    end

    @desc "Permanently delete an existing permission"
    field :destroy_permission, :permission do
      arg(:input, non_null(:id))

      middleware(&KempelenWeb.Graphql.Middlewares.Sessions.require_authentication/2)
      resolve(&KempelenWeb.Graphql.Resolvers.Permissions.destroy/3)
    end
  end
end
