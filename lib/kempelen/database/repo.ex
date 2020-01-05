defmodule Kempelen.Database.Repo do
  use Ecto.Repo,
    otp_app: :kempelen,
    adapter: Ecto.Adapters.Postgres
end
