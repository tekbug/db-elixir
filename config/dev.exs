import Config

config :database, Database.Repo,
  username: "postgres",
  password: "password",
  hostname: "localhost",
  database: "database_dev",
  stacktrace: true,
  show_sensitive_data_on_connection_error: true,
  pool_size: 10
