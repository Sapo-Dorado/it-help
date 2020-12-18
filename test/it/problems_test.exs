defmodule It.ProblemsTest do
  use It.DataCase

  alias It.Problems

  describe "counts" do
    alias It.Problems.Count

    @valid_attrs %{val: 42}
    @update_attrs %{val: 43}
    @invalid_attrs %{val: nil}

    def count_fixture(attrs \\ %{}) do
      {:ok, count} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Problems.create_count()

      count
    end

    test "list_counts/0 returns all counts" do
      count = count_fixture()
      assert Problems.list_counts() == [count]
    end

    test "get_count!/1 returns the count with given id" do
      count = count_fixture()
      assert Problems.get_count!(count.id) == count
    end

    test "create_count/1 with valid data creates a count" do
      assert {:ok, %Count{} = count} = Problems.create_count(@valid_attrs)
      assert count.val == 42
    end

    test "create_count/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Problems.create_count(@invalid_attrs)
    end

    test "update_count/2 with valid data updates the count" do
      count = count_fixture()
      assert {:ok, %Count{} = count} = Problems.update_count(count, @update_attrs)
      assert count.val == 43
    end

    test "update_count/2 with invalid data returns error changeset" do
      count = count_fixture()
      assert {:error, %Ecto.Changeset{}} = Problems.update_count(count, @invalid_attrs)
      assert count == Problems.get_count!(count.id)
    end

    test "delete_count/1 deletes the count" do
      count = count_fixture()
      assert {:ok, %Count{}} = Problems.delete_count(count)
      assert_raise Ecto.NoResultsError, fn -> Problems.get_count!(count.id) end
    end

    test "change_count/1 returns a count changeset" do
      count = count_fixture()
      assert %Ecto.Changeset{} = Problems.change_count(count)
    end
  end
end
