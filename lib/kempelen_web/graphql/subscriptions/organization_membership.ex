defmodule KempelenWeb.Graphql.Subscriptions.OrganizationMembership do
  use Absinthe.Schema.Notation

  object :organization_membership_subscriptions do
    @desc "When a new organization_membership is created"
    field :organization_membership_created, :organization_membership do
      arg :id, non_null(:id)

      # The topic function is used to determine what topic a given subscription
      # cares about based on its arguments.
      config fn args, _ ->
        {:ok, topic: args.id}
      end

      # This tells Absinthe to run any subscriptions with this field every time
      # the mutation happens. It also has a topic function used to find what
      # subscriptions care about this particular comment.
      trigger :create_organization_membership, topic: fn organization_membership ->
        organization_membership.id
      end
    end
  end
end
