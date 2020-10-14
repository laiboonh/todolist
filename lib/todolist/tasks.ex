defmodule Todolist.Tasks.Tasks do
  alias Todolist.Repo

  def get_all() do
    Repo.all(Todolist.Tasks.Task)
  end
end
