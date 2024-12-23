alias Database.Repo, as: Repo
alias Database.{Artist}
alias Database.Updater, as: Updater

birth_date = ~D[2000-08-06]
death_date = ~D[2090-08-06]

# insertion -> Repo.insert(%Table{params})
Repo.insert(%Artist{name: "Muhammed Murad"})

# retrieval -> Repo.get_by(Table, params)
output = Repo.get_by(Artist, name: "Muhammed")
IO.puts(output)
# update -> Repo.update(Ecto.Changeset.change(%Table{}, updated_param))
# first get what you want to change from the database
updated = Repo.get_by!(Artist, name: "Bill Evans")

# run the changes for that
changeset = Ecto.Changeset.change(updated, %{name: "Muhammed"})

# update the database
updated_set = Repo.update(changeset)

case updated_set do
  {:ok, changed_name} ->
    IO.puts("Data updated successfully")
    IO.inspect(changed_name)

  {:error, updated_set} ->
      IO.inspect(updated_set.errors)
end

# dynamic update
Updater.dynamic_update([id: 46], %{name: "Abiti", birth_date: birth_date, death_date: death_date})
