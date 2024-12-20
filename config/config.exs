import Config

config :database,
  ecto_repos: [Database.Repo],
  generators: [timestamp_type: :utc_datetime]

import_config "#{Mix.env()}.exs"
