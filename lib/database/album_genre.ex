defmodule Database.AlbumGenre do
  use Ecto.Schema
  alias Database.{Album, Genre}

  schema "album_genres" do
    belongs_to :album, Album
    belongs_to :genre, Genre
  end
end
