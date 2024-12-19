defmodule Database.SoloArtist do
  use Ecto.Schema
  import Ecto.Changeset

  embedded_schema do
    field :first_name, :string
    field :middle_name, :string
    field :last_name, :string
    field :birth_date, :date
    field :death_date, :date

    timestamps()
  end

  def changeset(solo_artist, params) do
    solo_artist
    |> cast(params, [:first_name, :middle_name, :last_name, :birth_date, :death_date])
    |> validate_required([:first_name, :middle_name])
    |> validate_date_order(:birth_date, :death_date)
  end

  defp validate_date_order(changeset, birth_date, death_date) do
    if birth_date > death_date do
      Ecto.Changeset.add_error(changeset, :death_date, message: "starting year must be less than end date")
    else
      changeset
    end
  end
end
