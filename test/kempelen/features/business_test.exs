defmodule Kempelen.BusinessTest do
  use Kempelen.DataCase, async: true

  describe "business" do
    def create_owner_account() do
      {:ok, account} = %Kempelen.Models.Account{}
      |> Kempelen.Models.Account.changeset(%{
        email: "sally@example.game"
      })
      |> Kempelen.Database.Repo.insert()
      account
    end

    def found_organization() do
      owner = create_owner_account()

      owner_permission = Kempelen.Database.Repo.get_by(Kempelen.Models.Permission, name: "Owner")

      assert owner_permission

      {:ok, organization} = %Kempelen.Models.Organization{}
          |> Kempelen.Models.Organization.changeset(%{
            name: "Hasbro"
          })
          |> Kempelen.Database.Repo.insert()
      {:ok, organization_membership} =
        %Kempelen.Models.OrganizationMembership{}
        |> Kempelen.Models.OrganizationMembership.changeset(%{
          account: owner,
          organization: organization
        })
        |> Kempelen.Database.Repo.insert()
      {:ok, _} =
        %Kempelen.Models.OrganizationPermission{}
        |> Kempelen.Models.OrganizationPermission.changeset(%{
          organization_membership: organization_membership,
          permission: owner_permission
        })
        |> Kempelen.Database.Repo.insert()
      assert Enum.member?(
          organization
            |> Kempelen.Database.Repo.preload(:accounts)
            |> Map.fetch!(:accounts),
          owner
        )
      organization
    end

    def make_game_for(organization) do
      {:ok, game} =
        %Kempelen.Models.Game{}
        |> Kempelen.Models.Game.changeset(%{
          name: "Settlers of Catan",
          organization: organization
        })
        |> Kempelen.Database.Repo.insert()
      game
    end

    def start_a_game(game, hoster) do
      {:ok, game_table} =
        %Kempelen.Models.GameTable{}
        |> Kempelen.Models.GameTable.changeset(%{
          name: "Anyone can join!",
          game: game
        })
        |> Kempelen.Database.Repo.insert()

      {:ok, game_seat} =
        %Kempelen.Models.GameSeat{}
        |> Kempelen.Models.GameSeat.changeset(%{
          name: "Kurtis",
          game_table: game_table,
          account: hoster,
          host: true
        })
        |> Kempelen.Database.Repo.insert()

      [game_seat, game_table]
    end

    def join_a_table(game_table, account) do
      {:ok, game_seat} =
        %Kempelen.Models.GameSeat{}
        |> Kempelen.Models.GameSeat.changeset(%{
          name: "Dufus",
          game_table: game_table,
          game_robot: account
        })
        |> Kempelen.Database.Repo.insert()
      game_seat
    end
    test "works" do
      hasbro = found_organization()
      game = make_game_for(hasbro)
      {:ok, place_road} =
        %Kempelen.Models.GamePlay{}
        |> Kempelen.Models.GamePlay.changeset(%{
          name: "Place Road",
          game: game
        })
        |> Kempelen.Database.Repo.insert()

      {:ok, beginner_robot} =
        %Kempelen.Models.GameRobot{}
        |> Kempelen.Models.GameRobot.changeset(%{
          name: "Beginner",
          game: game
        })
        |> Kempelen.Database.Repo.insert()

      {:ok, kurtis} =
        %Kempelen.Models.Account{}
        |> Kempelen.Models.Account.changeset(%{
          email: "kurtis@difference-engineers.org"
        })
        |> Kempelen.Database.Repo.insert()

      [seat_1, game_table] = start_a_game(game, kurtis)

      seat_2 = join_a_table(game_table, beginner_robot)

      # Game start
      # start_the_game()

      {:ok, round_1} =
        %Kempelen.Models.GameRound{}
        |> Kempelen.Models.GameRound.changeset(%{
          game_table: game_table
        })
        |> Kempelen.Database.Repo.insert()

      {:ok, _} =
        %Kempelen.Models.GameEvent{}
        |> Kempelen.Models.GameEvent.changeset(%{
          game_play: place_road,
          game_seat: seat_1,
          game_round: round_1
        })
        |> Kempelen.Database.Repo.insert()

      {:ok, _} =
        %Kempelen.Models.GameEvent{}
        |> Kempelen.Models.GameEvent.changeset(%{
          game_play: place_road,
          game_seat: seat_2,
          game_round: round_1
        })
        |> Kempelen.Database.Repo.insert()
    end
  end
end
