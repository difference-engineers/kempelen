defmodule Kempelen.Graphql.Resolvers.Accounts do
  def list(_parent, _arguments, _resolution) do
    {:ok, Kempelen.Database.Repo.all(Kempelen.Models.Account)}
  end

  def fetch(_parent, %{id: id}, _resolution) when not is_nil(id) do
    {:ok, Kempelen.Database.Repo.get(Kempelen.Models.Account, id)}
  end

  def create(_parent, arguments, _resolution) do
    default_attributes = %{
      username: List.first(String.split(arguments[:email], "@")),
      password: arguments[:password] || (:crypto.strong_rand_bytes(24) |> Base.encode32(case: :upper) |> binary_part(0, 24))
    }
    attributes = Map.merge(default_attributes, arguments)

    %Kempelen.Models.Account{}
      |> Kempelen.Models.Account.changeset(attributes)
      |> case do
        %Ecto.Changeset{valid?: true} = changeset -> Kempelen.Database.Repo.insert(changeset)
        %Ecto.Changeset{valid?: false} = changeset -> {:error, changeset}
      end
  end

  def grant_administration_powers(_parent, %{account_id: account_id}, _resolution) when is_bitstring(account_id) do
    Kempelen.Database.Repo.get(Kempelen.Models.Account, account_id)
      |> Kempelen.Models.Account.grant_administrator_powers!()
  end
end
