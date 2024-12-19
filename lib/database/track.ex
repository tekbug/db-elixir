defmodule Database.Track do
  use Ecto.Schema

  schema "tracks" do
    field :title, :string
    field :duration, :decimal
    field :duration_string, :string, virtual: true
    field :number_of_plays, :integer
    timestamps()

    belongs_to(:album, Database.Album)
  end
end
