import Config

config :database, Database.Repo,
  username: "postgres",
  password: "password",
  hostname: "localhost",
  database: "database_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: System.schedulers_online() * 2



