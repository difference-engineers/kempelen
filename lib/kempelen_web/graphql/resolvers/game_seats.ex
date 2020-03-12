defmodule KempelenWeb.Graphql.Resolvers.GameSeats do
  @spec list(any, any, any) :: {:ok, [%Kempelen.Models.GameSeat{}]} | {:error, any}
  def list(_parent, _arguments, _resolution) do
    {:ok, Kempelen.Database.Repo.all(Kempelen.Models.GameSeat)}
  end

  @spec find(any, %{input: %{id: bitstring}}, any) ::
          {:ok, %Kempelen.Models.GameSeat{}} | {:error, any}
  def find(_parent, %{input: %{id: id}}, _resolution) when not is_nil(id) and is_bitstring(id) do
    {:ok, Kempelen.Database.Repo.get(Kempelen.Models.GameSeat, id)}
  end

  @spec create(any, %{input: map}, any) :: {:ok, %Kempelen.Models.GameSeat{}} | {:error, any}
  def create(_parent, %{input: input}, _resolution) do
    %Kempelen.Models.GameSeat{}
    |> Kempelen.Models.GameSeat.changeset(input)
    |> case do
      %Ecto.Changeset{valid?: true} = changeset -> Kempelen.Database.Repo.insert(changeset)
      %Ecto.Changeset{valid?: false} = changeset -> {:error, changeset}
    end
  end

  @spec update(any, %{input: %{:id => bitstring, optional(atom) => any}}, any) ::
          {:ok, %Kempelen.Models.GameSeat{}} | {:error, any}
  def update(_parent, %{input: %{id: id} = input}, _resolution) when is_bitstring(id) do
    Kempelen.Database.Repo.get!(Kempelen.Models.GameSeat, id)
    |> Kempelen.Models.GameSeat.changeset(input)
    |> case do
      %Ecto.Changeset{valid?: true} = changeset -> Kempelen.Database.Repo.insert(changeset)
      %Ecto.Changeset{valid?: false} = changeset -> {:error, changeset}
    end
  end

  @spec destroy(any, %{input: %{id: bitstring}}, any) ::
          {:ok, %Kempelen.Models.GameSeat{}} | {:error, any}
  def destroy(_parent, %{input: %{id: id}}, _resolution)
      when not is_nil(id) and is_bitstring(id) do
    Kempelen.Database.Repo.get(Kempelen.Models.GameSeat, id)
    |> Kempelen.Database.Repo.delete()
  end
end
