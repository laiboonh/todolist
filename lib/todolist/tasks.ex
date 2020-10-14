defmodule Todolist.Tasks do
  alias Todolist.Repo
  alias Todolist.Tasks.Task
  alias Todolist.Tags

  def get_all() do
    Repo.all(Task)
  end

  def create_task(attrs \\ %{}) do
    %Task{}
    |> Task.changeset(attrs)
    |> Repo.insert()
  end

  def get_task!(id), do: Repo.get!(Task, id) |> Repo.preload(:tags)

  def tag_task(%Task{id: task_id}, tag_names) when is_binary(tag_names) do
    tags =
      tag_names
      |> Tags.tag_name_list()
      |> Enum.map(&Tags.ensure_tag_exists/1)

    Todolist.Tasks.get_task!(task_id)
    |> Repo.preload(:tags)
    |> Ecto.Changeset.change()
    |> Ecto.Changeset.put_assoc(:tags, tags)
    |> Repo.update()
  end
end
