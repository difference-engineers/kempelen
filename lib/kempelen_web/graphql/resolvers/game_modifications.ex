defmodule KempelenWeb.Graphql.Resolvers.GameModifications do
  def list(_parent, _arguments, _resolution) do
    {:ok, Kempelen.Database.Repo.all(Kempelen.Models.GameModification)}
  end

  def fetch(_parent, %{id: id}, _resolution) when not is_nil(id) do
    {:ok, Kempelen.Database.Repo.get(Kempelen.Models.GameModification, id)}
  end

  def create(_parent, arguments, _resolution) do
    default_attributes = %{}
    attributes = Map.merge(default_attributes, arguments)

    %Kempelen.Models.GameModification{}
      |> Kempelen.Models.GameModification.changeset(attributes)
      |> case do
        %Ecto.Changeset{valid?: true} = changeset -> Kempelen.Database.Repo.insert(changeset)
        %Ecto.Changeset{valid?: false} = changeset -> {:error, changeset}
      end
  end

  def update(_parent, %{id: id} = arguments, _resolution) when not is_nil(id) do
    Kempelen.Database.Repo.get(Kempelen.Models.GameModification, id)
      |> Kempelen.Models.GameModification.changeset(arguments)
      |> case do
        %Ecto.Changeset{valid?: true} = changeset -> Kempelen.Database.Repo.insert(changeset)
        %Ecto.Changeset{valid?: false} = changeset -> {:error, changeset}
      end
  end

  def destroy(_parent, %{id: id}, _resolution) when not is_nil(id) do
    Kempelen.Database.Repo.get(Kempelen.Models.GameModification, id)
      |> Kempelen.Database.Repo.delete
  end
end
