defmodule Database.AlbumWithEmbeds do
  use Ecto.Schema
  alias Database.{ArtistEmbed, TrackEmbed}

  schema "albums_with_embeds" do
    field :title, :string
    embeds_one :artist, ArtistEmbed, on_replace: :update
    embeds_many :tracks, TrackEmbed, on_replace: :delete
  end
end
