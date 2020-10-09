defmodule TodolistWeb.PageControllerTest do
  use TodolistWeb.ConnCase

  setup %{conn: conn} = config do
    if config[:logged_in] == true do
      user = %Todolist.Users.User{email: "test@example.com", id: 1}
      authed_conn = Pow.Plug.assign_current_user(conn, user, [])
      {:ok, conn: conn, authed_conn: authed_conn}
    else
      {:ok, conn: conn}
    end
  end

  @tag logged_in: true
  test "GET / when authenticated", %{authed_conn: authed_conn} do
    conn = get(authed_conn, "/")
    assert html_response(conn, 200) =~ "Welcome to Phoenix!"
  end

  test "GET / when not authenticated gets redirected to sign in page", %{conn: conn} do
    conn = get(conn, "/")
    conn = get(conn, redirected_to(conn, 302))
    assert html_response(conn, 200) =~ "Sign in"
  end
end
