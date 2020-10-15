defmodule Todolist.Repo.Migrations.CreateTasksTags do
  use Ecto.Migration

  def change do
    create table(:tasks_tags, primary_key: false) do
      add :task_id, references(:tasks)
      add :tag_id, references(:tags)
    end
  end
end
