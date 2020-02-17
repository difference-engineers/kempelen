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
{:ok, owner_permission} = %Kempelen.Models.Permission{}
  |> Kempelen.Models.Permission.changeset(%{
      name: "Owner"
    })
  |> Kempelen.Database.Repo.insert

{:ok, sally} = %Kempelen.Models.Account{}
  |> Kempelen.Models.Account.changeset(%{
      email: "sally@example.game"
    })
  |> Kempelen.Database.Repo.insert

{:ok, hasbro} = %Kempelen.Models.Organization{}
  |> Kempelen.Models.Organization.changeset(%{
      name: "Hasbro"
    })
  |> Kempelen.Database.Repo.insert

{:ok, organization_membership} = %Kempelen.Models.OrganizationMembership{}
  |> Kempelen.Models.OrganizationMembership.changeset(%{
      account: sally,
      organization: hasbro
    })
  |> Kempelen.Database.Repo.insert

{:ok, organization_permission} = %Kempelen.Models.OrganizationPermission{}
  |> Kempelen.Models.OrganizationPermission.changeset(%{
      organization_membership: organization_membership,
      permission: owner_permission
    })
  |> Kempelen.Database.Repo.insert

{:ok, setters_of_catan} = %Kempelen.Models.Game{}
  |> Kempelen.Models.Game.changeset(%{
      name: "Settlers of Catan",
      organization: hasbro
    })
  |> Kempelen.Database.Repo.insert

{:ok, place_road} = %Kempelen.Models.GamePlay{}
  |> Kempelen.Models.GamePlay.changeset(%{
      name: "Place Road",
      game: setters_of_catan
    })
  |> Kempelen.Database.Repo.insert

{:ok, beginner_robot} = %Kempelen.Models.GameRobot{}
  |> Kempelen.Models.GameRobot.changeset(%{
      name: "Beginner",
      game: setters_of_catan
    })
  |> Kempelen.Database.Repo.insert

{:ok, kurtis} = %Kempelen.Models.Account{}
  |> Kempelen.Models.Account.changeset(%{
      email: "kurtis@difference-engineers.org"
    })
  |> Kempelen.Database.Repo.insert

# Starting a game
{:ok, table_1} = %Kempelen.Models.GameTable{}
  |> Kempelen.Models.GameTable.changeset(%{
      name: "FFA",
      game: setters_of_catan
    })
  |> Kempelen.Database.Repo.insert

{:ok, player_1} = %Kempelen.Models.GameSeat{}
  |> Kempelen.Models.GameSeat.changeset(%{
      name: "Kurtis",
      game_table: table_1,
      account: kurtis,
      host: true
    })
  |> Kempelen.Database.Repo.insert

{:ok, player_2} = %Kempelen.Models.GameSeat{}
  |> Kempelen.Models.GameSeat.changeset(%{
      name: "Dufus",
      game_table: table_1,
      game_robot: beginner_robot
    })
  |> Kempelen.Database.Repo.insert

# Game start
{:ok, round_1} = %Kempelen.Models.GameRound{}
  |> Kempelen.Models.GameRound.changeset(%{
      game_table: table_1
    })
  |> Kempelen.Database.Repo.insert

{:ok, act_1} = %Kempelen.Models.GameAct{}
  |> Kempelen.Models.GameAct.changeset(%{
      game_play: place_road,
      game_seat: player_1,
      game_round: round_1
    })
  |> Kempelen.Database.Repo.insert

{:ok, act_2} = %Kempelen.Models.GameAct{}
  |> Kempelen.Models.GameAct.changeset(%{
      game_play: place_road,
      game_seat: player_2,
      game_round: round_1
    })
  |> Kempelen.Database.Repo.insert
