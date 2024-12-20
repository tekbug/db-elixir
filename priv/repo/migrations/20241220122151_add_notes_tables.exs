defmodule Database.Repo.Migrations.AddNotesTables do
  use Ecto.Migration

  def change do
    create table(:notes_with_fk_fields) do
      add :note, :text, null: false
      add :author, :string, null: false
      add :artist_id, references(:artists, on_delete: :delete_all)
      add :album_id, references(:albums, on_delete: :delete_all)
      add :track_id, references(:tracks, on_delete: :delete_all)

      timestamps()
    end
    fk_checks = """
      (CASE WHEN artist_id IS NULL THEN 0 ELSE 1 END) +
      (CASE WHEN album_id IS NULL THEN 0 ELSE 1 END) +
      (CASE WHEN track_id IS NULL THEN 0 ELSE 1 END) = 1
    """

    create constraint(:notes_with_fk_fields, :only_one_fk, check: fk_checks)

    create table(:notes_with_artists) do
      add :note, :text, null: false
      add :author, :string, null: false
      add :assoc_id, references(:artists, on_delete: :delete_all)
      timestamps()
    end

    create table(:notes_with_albums) do
      add :note, :text, null: false
      add :author, :string, null: false
      add :assoc_id, references(:albums, on_delete: :delete_all)
      timestamps()
    end

    create table(:notes_with_tracks) do
      add :note, :text, null: false
      add :author, :string, null: false
      add :assoc_id, references(:tracks, on_delete: :delete_all)
      timestamps()
    end

    create table(:notes_with_joins) do
      add :note, :text, null: false
      add :author, :string, null: false
      add :assoc_id, references(:tracks, on_delete: :delete_all)
      timestamps()
    end
  end
end
