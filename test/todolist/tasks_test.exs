defmodule Todolist.TasksTest do
  use Todolist.DataCase

  alias Todolist.Tasks
  alias Todolist.Tags

  describe "tasks" do
    test "tag_task" do
      {:ok, task} = Tasks.create_task(%{name: "foo"})
      {:ok, task} = Tasks.tag_task(task, "foo,bar")
      assert Enum.map(task.tags, & &1.name) == ["foo", "bar"]

      first_tag = List.first(task.tags)
      tag = Tags.get_tag!(first_tag.id)
      assert tag.name == "foo"
    end
  end
end
