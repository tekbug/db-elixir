defmodule Database.Album do
  use Ecto.Schema
  alias Database.{Artist, Track, Genre}

  schema "albums" do
    field :title, :string

    belongs_to(:artist, Artist)
    has_many(:tracks, Track)
    many_to_many(:genres, Genre, join_through: "albums_genres")
  end
end
