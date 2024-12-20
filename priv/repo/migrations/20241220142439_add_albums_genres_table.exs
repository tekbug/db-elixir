defmodule Database.Repo.Migrations.AddAlbumsGenresTable do
  use Ecto.Migration

  def change do
    create table(:albums_genres) do
      add :album_id, references(:albums, on_delete: :delete_all)
      add :genre_id, references(:genres, on_delete: :delete_all)
      timestamps null: true
    end
    create index(:albums_genres, [:album_id, :genre_id])
  end
end
