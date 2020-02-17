defmodule KempelenWeb.Graphql.Resolvers.Organizations do
  def list(_parent, _arguments, _resolution) do
    {:ok, Kempelen.Database.Repo.all(Kempelen.Models.Organization)}
  end

  def fetch(_parent, %{id: id}, _resolution) when not is_nil(id) do
    {:ok, Kempelen.Database.Repo.get(Kempelen.Models.Organization, id)}
  end

  def create(_parent, arguments, _resolution) do
    default_attributes = %{}
    attributes = Map.merge(default_attributes, arguments)

    # TODO: Create permissions
    # TODO: Create
    %Kempelen.Models.Organization{}
      |> Kempelen.Models.Organization.changeset(attributes)
      |> case do
        %Ecto.Changeset{valid?: true} = changeset -> Kempelen.Database.Repo.insert(changeset)
        %Ecto.Changeset{valid?: false} = changeset -> {:error, changeset}
      end
  end

  def update(_parent, %{id: id} = arguments, _resolution) when not is_nil(id) do
    Kempelen.Database.Repo.get(Kempelen.Models.Organization, id)
      |> Kempelen.Models.Organization.changeset(arguments)
      |> case do
        %Ecto.Changeset{valid?: true} = changeset -> Kempelen.Database.Repo.insert(changeset)
        %Ecto.Changeset{valid?: false} = changeset -> {:error, changeset}
      end
  end
end
