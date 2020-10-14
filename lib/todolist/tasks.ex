defmodule Todolist.Tasks do
  alias Todolist.Repo
  alias Todolist.Tasks.Task

  def get_all() do
    Repo.all(Task)
  end

  def get_task!(id), do: Repo.get!(Task, id) |> Repo.preload(:tags)
end
