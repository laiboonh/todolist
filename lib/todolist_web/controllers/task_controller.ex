defmodule TodolistWeb.TaskController do
  use TodolistWeb, :controller

  def index(conn, _params) do
    tasks = Todolist.Tasks.Task.get_all() |> Enum.map(fn(%Todolist.Tasks.Task{name: name}) -> name end)
    render(conn, "task.html", tasks: tasks)
    #conn |> put_status(200) |> render("list.json", %{name: list})
  end
end
