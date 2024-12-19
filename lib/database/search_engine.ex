defmodule Database.SearchEngine do
  def update!(item) do
    # do something and then returns
    {:ok, item}
  end

  def update(item) do
    # do something and then also
    {:ok, item}
  end

  def update(_repo, changes, extra_argument) do
    {:ok, changes, extra_argument}
  end
end
