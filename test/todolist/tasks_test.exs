defmodule Todolist.TasksTest do
  use Todolist.DataCase

  alias Todolist.Tasks
  alias Todolist.Tags
  alias Todolist.Tasks.Task

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

    test "create_task_with_tags" do
      {:ok, %{task: %Task{id: task_id}}} =
        Tasks.create_task_with_tags(%{name: "todo1", tag_name: "tag1, tag2"})

      task = Tasks.get_task!(task_id)
      assert Enum.map(task.tags, & &1.name) == ["tag1", "tag2"]
    end

    test "create_task_with_tags transactionality" do
      Ecto.Adapters.SQL.query(Todolist.Repo, "drop table tasks_tags")

      assert_raise(Postgrex.Error, fn ->
        Tasks.create_task_with_tags(%{name: "todo1", tag_name: "tag1, tag2"})
      end)

      # check that creation of task is rolled back
      nil = Repo.get_by(Task, name: "todo1")
    end
  end
end
