defmodule Database.TrackEmbed do
  import Ecto.Changeset
  use Ecto.Schema

  embedded_schema do
    field :title, :string
    field :duration, :string

    timestamps()
  end

  def changeset(eTrack, params) do
    eTrack
    |> cast(params, [:title, :duration])
    |> validate_required([:title])
  end
end
