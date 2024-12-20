defmodule Database.Repo.Migrations.AddTracksTable do
  use Ecto.Migration

  def change do
    create table(:tracks) do
      add :title, :string, null: false
      add :duration, :decimal, null: true, default: 0.0
      add :duration_string, :string, null: true
      add :number_of_plays, :integer, null: false, default: 0
      add :album_id, references(:albums, on_delete: :delete_all), null: false
      timestamps()
    end

    create index(:tracks, [:title, :album_id])
  end
end
