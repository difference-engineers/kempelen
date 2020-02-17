defmodule KempelenWeb.Graphql.Types.OrganizationMembership do
  use Absinthe.Schema.Notation
  use Absinthe.Ecto, repo: Kempelen.Database.Repo

  object :organization_membership do
    field :id, non_null(:id)
    field :games, non_null(:game)
    field :inserted_at, non_null(:naive_datetime)
    field :updated_at, non_null(:naive_datetime)
  end
end
