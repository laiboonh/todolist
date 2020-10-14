defmodule Todolist.Tasks.Task do
  use Ecto.Schema
  use Pow.Ecto.Schema

  schema "tasks" do
    field(:name, :string)

    timestamps()
  end

end
