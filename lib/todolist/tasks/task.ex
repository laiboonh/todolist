defmodule Todolist.Tasks.Task do
  use Ecto.Schema
  use Pow.Ecto.Schema

  schema "tasks" do
    field(:name, :string)
    many_to_many :tags, Todolist.Tags.Tag, join_through: "tasks_tags", on_replace: :delete

    timestamps()
  end
end
