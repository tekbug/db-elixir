defmodule Database.Repo.Migrations.AddGenresTable do
  use Ecto.Migration

  def change do
    create table(:genres) do
      add :name, :string, null: false
      add :wiki_tag, :string, null: true
      timestamps()
    end
    create index(:genres, :name, unique: true)
  end
end
