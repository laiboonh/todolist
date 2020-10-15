defmodule Todolist.TasksTest do
  use Todolist.DataCase

  alias Todolist.Tasks
  alias Todolist.Tags

  describe "tasks" do
    test "tag_task" do
      {:ok, task} = Tasks.create_task(%{name: "todo1"})
      {:ok, task} = Tasks.tag_task(task, "tag1,tag2")
      assert Enum.map(task.tags, & &1.name) == ["tag1", "tag2"]

      first_tag = List.first(task.tags)
      tag = Tags.get_tag!(first_tag.id)
      task = List.first(tag.tasks)
      assert task.name == "todo1"
    end
  end
end
