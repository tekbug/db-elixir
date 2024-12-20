defmodule Database.Repo.Migrations.AddAlbumsWithEmbeds do
  use Ecto.Migration

  def change do
    create table(:albums_with_embeds) do
      add :title, :string
      add :artists, :jsonb
      add :tracks, {:array, :jsonb}, default: []

      timestamps()
    end
    create index(:albums_with_embeds, :title)
  end
end
