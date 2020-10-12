defmodule Todolist.UserTest do
  use ExUnit.Case, async: true

  alias Todolist.Repo
  alias Todolist.Users.User

  setup do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Repo)
  end

  test "insert user" do
    email = "test@example.com"
    user = Repo.insert!(%User{email: email})
    new_user = Repo.get!(User, user.id)
    assert new_user.email == email
  end
end
