use Mix.Config

# Configure your database
config :kempelen, Kempelen.Database.Repo,
  username: "postgres",
  password: "password",
  database: "kempelen_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# Oban configuration
config :kempelen, Oban,
  crontab: false,
  queues: false,
  prune: :disabled

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :kempelen, KempelenWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn
