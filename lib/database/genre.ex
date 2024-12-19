defmodule Database.Genre do
  use Ecto.Schema
  alias Database.Album, as: Album

  schema "genres" do
    field :name
    field :wiki_tag

    timestamps()

    many_to_many(:albums, Album, join_through: "album_genres")
  end
end
