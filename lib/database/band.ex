defmodule Database.Band do
  use Ecto.Schema
  import Ecto.Changeset

  schema "bands" do
    field :band_name, :string
    field :year_started, :integer
    field :year_ended, :integer

    timestamps()
  end

  def changeset(bands, params) do
    bands
    |> cast(params, [:band_name, :year_started, :year_ended])
    |> validate_required([:band_name, :year_started])

    # you can add custom validations
    |> validate_year(:year_started, :year_ended)
    |> validate_band_name(:band_name)
  end

  defp validate_year(changeset, year_started, year_ended) do
    if year_started > year_ended do
      Ecto.Changeset.add_error(changeset, :year_started, "The start year must be before the ending year")
    else
      changeset
    end
  end

  defp validate_band_name(changeset, band_name) do
    name = "Something"

    if band_name != name do
      Ecto.Changeset.add_error(changeset, :band_name, "band name does not match")
    else
      changeset
    end
  end

  def to_artist(band) do
    {:ok, birth_date} = Date.new(band.year_started, 1, 1)
    {:ok, death_date} = Date.new(band.year_ended, 12, 31)
    %{name: band.band_name, birth_date: birth_date, death_date: death_date}
  end
end
