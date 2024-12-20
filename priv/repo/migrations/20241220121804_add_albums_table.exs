defmodule Database.Repo.Migrations.AddAlbumsTable do
  use Ecto.Migration

  def change do
    create table(:albums) do
      add :title, :string
      add :artist_id, references(:artists, on_delete: :delete_all)
    end

    create index(:albums, :title)
  end
end
