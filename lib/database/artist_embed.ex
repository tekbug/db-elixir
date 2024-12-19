defmodule Database.ArtistEmbed do
  import Ecto.Changeset
  use Ecto.Schema


  embedded_schema do
    field(:name)
  end

  def changeset(artist_embed, attrs) do
    artist_embed
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
