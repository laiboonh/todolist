defmodule Todolist.Tasks.Task do
  use Ecto.Schema
  use Pow.Ecto.Schema
  alias Todolist.Repo

  schema "task" do
    field(:name, :string)

    timestamps()
  end

  def get_all() do
    Repo.all(__MODULE__)
  end
end
