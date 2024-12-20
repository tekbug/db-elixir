defmodule Database.Repo.Migrations.AddLogsTable do
  use Ecto.Migration

  def change do
    create table(:logs_table) do
      add :operation, :string, null: false
      add :item, :map, null: true
      add :changes, :map, null: true

      timestamps()
    end
  end
end
