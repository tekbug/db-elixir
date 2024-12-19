defmodule Database.Log do
  use Ecto.Schema
  import Ecto.Changeset
  alias Ecto.Changeset
  alias Database.Log

  schema "logs" do
    field :operation, :string
    field :item, :map
    field :changes, :map

    timestamps()
  end

  def changeset_for_insert(%Changeset{} = changeset) do
    change(%Log{operation: "insert", item: serialize_schema(changeset.data)})
  end

  def changeset_for_insert(%{__meta__: %Ecto.Schema.Metadata{}} = item) do
    change(%Log{operation: "insert", item: serialize_schema(item)})
  end

  def changeset_for_insert(_other) do
    raise "It's like telling the method only accept one type of form but in a cool way"
  end

  def serialize_schema(schema) do
    schema.__struct__.__schema__(:fields)
    |> Enum.reduce(%{}, fn (field, acc) ->
        Map.put(acc, field, Map.get(schema, field))
    end)
  end
end
