defmodule Todolist.Repo.Migrations.CreateTask do
  use Ecto.Migration

  def change do
    create table(:task) do
      add :name, :string, null: false
      timestamps()
    end
  end
end
