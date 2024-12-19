defmodule Database.Artist do
  use Ecto.Schema
  import Ecto.Changeset
  alias Database.{Artist, Album}

  schema "artists" do
    field :name, :string
    field :birth_date, :date
    field :death_date, :date

    timestamps()

    has_many(:albums, Album)
    has_many(:tracks, through: [:albums, :tracks])
  end

  def changeset(artist, params) do
    artist
    |> cast(params, [:name, :birth_date, :death_date])
    |> validate_required([:name])
  end

  def changeset(%Database.Band{} = band) do
    {:ok, birth_date} = Date.new(band.year_started, 1, 1)
    {:ok, death_date} = Date.new(band.year_ended, 12, 31)

    changeset(%Artist{
      name: band.band_name,
      birth_date: birth_date,
      death_date: death_date
    })
  end

  def changeset(%Database.SoloArtist{} = solo_artist) do
    name = "#{solo_artist.first_name} #{solo_artist.middle_name} #{solo_artist.last_name}"
    |> String.trim()

    %{name: name, birth_date: solo_artist.birth_date, death_date: solo_artist.death_date}
  end
end
