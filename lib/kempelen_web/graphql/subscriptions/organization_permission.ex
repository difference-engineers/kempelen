defmodule KempelenWeb.Graphql.Subscriptions.OrganizationPermission do
  use Absinthe.Schema.Notation

  object :organization_permission_subscriptions do
    @desc "When a new organization_permission is created"
    field :organization_permission_created, :organization_permission do
      arg :id, non_null(:id)

      # The topic function is used to determine what topic a given subscription
      # cares about based on its arguments.
      config fn args, _ ->
        {:ok, topic: args.id}
      end

      # This tells Absinthe to run any subscriptions with this field every time
      # the mutation happens. It also has a topic function used to find what
      # subscriptions care about this particular comment.
      trigger :create_organization_permission, topic: fn organization_permission ->
        organization_permission.id
      end
    end
  end
end
