defmodule Todolist.Tasks.Task do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tasks" do
    field(:name, :string)
    many_to_many :tags, Todolist.Tags.Tag, join_through: "tasks_tags", on_replace: :delete

    timestamps()
  end

  @doc false
  def changeset(task, attrs) do
    task
    |> cast(attrs, [:name])
    |> validate_required([:name])
    |> unique_constraint(:name)
  end
end
