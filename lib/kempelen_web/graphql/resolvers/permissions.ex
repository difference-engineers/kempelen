defmodule KempelenWeb.Graphql.Resolvers.Permissions do
  @spec list(any, any, any) :: {:ok, [%Kempelen.Models.Permission{}]} | {:error, any}
  def list(_parent, _arguments, _resolution) do
    {:ok, Kempelen.Database.Repo.all(Kempelen.Models.Permission)}
  end

  @spec find(any, %{input: %{id: bitstring}}, any) ::
          {:ok, %Kempelen.Models.Permission{}} | {:error, any}
  def find(_parent, %{input: %{id: id}}, _resolution) when not is_nil(id) and is_bitstring(id) do
    {:ok, Kempelen.Database.Repo.get(Kempelen.Models.Permission, id)}
  end

  @spec create(any, %{input: map}, any) :: {:ok, %Kempelen.Models.Permission{}} | {:error, any}
  def create(_parent, %{input: input}, _resolution) do
    %Kempelen.Models.Permission{}
    |> Kempelen.Models.Permission.changeset(input)
    |> case do
      %Ecto.Changeset{valid?: true} = changeset -> Kempelen.Database.Repo.insert(changeset)
      %Ecto.Changeset{valid?: false} = changeset -> {:error, changeset}
    end
  end

  @spec update(any, %{input: %{:id => bitstring, optional(atom) => any}}, any) ::
          {:ok, %Kempelen.Models.Permission{}} | {:error, any}
  def update(_parent, %{input: %{id: id} = input}, _resolution) when is_bitstring(id) do
    Kempelen.Database.Repo.get!(Kempelen.Models.Permission, id)
    |> Kempelen.Models.Permission.changeset(input)
    |> case do
      %Ecto.Changeset{valid?: true} = changeset -> Kempelen.Database.Repo.insert(changeset)
      %Ecto.Changeset{valid?: false} = changeset -> {:error, changeset}
    end
  end

  @spec destroy(any, %{input: %{id: bitstring}}, any) ::
          {:ok, %Kempelen.Models.Permission{}} | {:error, any}
  def destroy(_parent, %{input: %{id: id}}, _resolution)
      when not is_nil(id) and is_bitstring(id) do
    Kempelen.Database.Repo.get(Kempelen.Models.Permission, id)
    |> Kempelen.Database.Repo.delete()
  end
end
