# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Kempelen.Database.Repo.insert!(%Kempelen.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
{:ok, _} = %Kempelen.Models.Permission{}
  |> Kempelen.Models.Permission.changeset(%{
      name: "Owner"
    })
  |> Kempelen.Database.Repo.insert
{:ok, _} = %Kempelen.Models.Permission{}
  |> Kempelen.Models.Permission.changeset(%{
      name: "Game Manager"
    })
  |> Kempelen.Database.Repo.insert
{:ok, _} = %Kempelen.Models.Permission{}
  |> Kempelen.Models.Permission.changeset(%{
      name: "Finance Manager"
    })
  |> Kempelen.Database.Repo.insert
{:ok, _} = %Kempelen.Models.Permission{}
  |> Kempelen.Models.Permission.changeset(%{
      name: "Sales Manager"
    })
  |> Kempelen.Database.Repo.insert
