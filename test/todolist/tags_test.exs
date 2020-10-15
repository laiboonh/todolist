defmodule Todolist.TagsTest do
  use Todolist.DataCase

  alias Todolist.Tags

  setup do
    %{
      valid_attrs: %{name: "some name"},
      update_attrs: %{name: "some updated name"},
      invalid_attrs: %{name: nil}
    }
  end

  describe "tags" do
    alias Todolist.Tags.Tag

    def tag_fixture(attrs \\ %{}) do
      {:ok, tag} =
        attrs
        |> Tags.create_tag()

      %Tag{tag | tasks: []}
    end

    test "list_tags/0 returns all tags", context do
      tag = tag_fixture(context.valid_attrs)
      assert Tags.list_tags() == [tag]
    end

    test "get_tag!/1 returns the tag with given id", context do
      tag = tag_fixture(context.valid_attrs)
      assert Tags.get_tag!(tag.id) == tag
    end

    test "create_tag/1 with valid data creates a tag", context do
      assert {:ok, %Tag{} = tag} = Tags.create_tag(context.valid_attrs)
      assert tag.name == "some name"
    end

    test "create_tag/1 with invalid data returns error changeset", context do
      assert {:error, %Ecto.Changeset{}} = Tags.create_tag(context.invalid_attrs)
    end

    test "update_tag/2 with valid data updates the tag", context do
      tag = tag_fixture(context.valid_attrs)
      assert {:ok, %Tag{} = tag} = Tags.update_tag(tag, context.update_attrs)
      assert tag.name == "some updated name"
    end

    test "update_tag/2 with invalid data returns error changeset", context do
      tag = tag_fixture(context.valid_attrs)
      assert {:error, %Ecto.Changeset{}} = Tags.update_tag(tag, context.invalid_attrs)
      assert tag == Tags.get_tag!(tag.id)
    end

    test "delete_tag/1 deletes the tag", context do
      tag = tag_fixture(context.valid_attrs)
      assert {:ok, %Tag{}} = Tags.delete_tag(tag)
      assert_raise Ecto.NoResultsError, fn -> Tags.get_tag!(tag.id) end
    end

    test "change_tag/1 returns a tag changeset", context do
      tag = tag_fixture(context.valid_attrs)
      assert %Ecto.Changeset{} = Tags.change_tag(tag)
    end

    test "tag_name_list when given empty tag names return empty list" do
      assert Tags.tag_name_list(",,") == []
      assert Tags.tag_name_list("a,b,") == ["a", "b"]
    end
  end
end
