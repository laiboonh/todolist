defmodule TodolistWeb.PageControllerTest do
  use TodolistWeb.ConnCase

  setup %{conn: conn} do
    user = %Todolist.Users.User{email: "test@example.com", id: 1}
    authed_conn = Pow.Plug.assign_current_user(conn, user, [])

    {:ok, conn: conn, authed_conn: authed_conn}
  end

  test "GET /", %{authed_conn: authed_conn} do
    conn = get(authed_conn, "/")
    assert html_response(conn, 200) =~ "Welcome to Phoenix!"
  end
end
