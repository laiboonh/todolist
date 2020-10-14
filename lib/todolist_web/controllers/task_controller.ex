defmodule TodolistWeb.TaskController do
  use TodolistWeb, :controller

  def index(conn, _params) do
    tasks = Todolist.Tasks.Tasks.get_all() |> Enum.map(& &1.name)
    render(conn, "task.html", tasks: tasks)
  end
end
