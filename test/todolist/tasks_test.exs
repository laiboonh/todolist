defmodule Todolist.TasksTest do
  use Todolist.DataCase

  alias Todolist.Tasks

  describe "tasks" do
    test "tag_task" do
      {:ok, task} = Tasks.create_task(%{name: "foo"})
      {:ok, task} = Tasks.tag_task(task, "foo,bar")
      assert Enum.map(task.tags, & &1.name) == ["foo", "bar"]
    end
  end
end
