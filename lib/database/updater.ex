defmodule Database.Updater do
  import Ecto.Query
  alias Database.Repo
  alias Database.Artist, as: Artist

  def dynamic_update(query_param, updated_param) do
    search = Repo.get_by(Artist, query_param)

    case search do
      nil ->
        error_msg = "There is no Artist that can be located by your query! Try again."
        IO.puts(error_msg)
        {:error, error_msg}

      updated_artist ->
        changeset = Ecto.Changeset.change(updated_artist, updated_param)

        case Repo.update(changeset) do
          {:ok, updated_artist} ->
            IO.puts("Artist updated successfully")
            IO.inspect(updated_artist)
            {:ok, updated_artist}

            {:error, changeset} ->
              IO.puts("Error occurred")
              IO.inspect(changeset.errors)
              {:error, changeset}
        end
    end
  end
end