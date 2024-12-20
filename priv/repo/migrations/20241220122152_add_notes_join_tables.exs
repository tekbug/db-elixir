defmodule Database.Repo.Migrations.AddNotesJoinTables do
  use Ecto.Migration

  def change do
    create table(:artists_notes) do
      add :artist_id, references(:artists, on_delete: :delete_all)
      add :note_id, references(:notes_with_joins, on_delete: :delete_all)
      timestamps()
    end

    create table(:albums_notes) do
      add :album_id, references(:albums, on_delete: :delete_all)
      add :note_id, references(:notes_with_joins, on_delete: :delete_all)
      timestamps()
    end

    create table(:tracks_notes) do
      add :track_id, references(:tracks, on_delete: :delete_all)
      add :note_id, references(:notes_with_joins, on_delete: :delete_all)
      timestamps()
    end
    create index(:tracks_notes, [:track_id, :note_id])
  end
end
