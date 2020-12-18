defmodule ItWeb.CountControllerTest do
  use ItWeb.ConnCase

  alias It.Problems

  @create_attrs %{val: 42}
  @update_attrs %{val: 43}
  @invalid_attrs %{val: nil}

  def fixture(:count) do
    {:ok, count} = Problems.create_count(@create_attrs)
    count
  end

  describe "index" do
    test "lists all counts", %{conn: conn} do
      conn = get(conn, Routes.count_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Counts"
    end
  end

  describe "new count" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.count_path(conn, :new))
      assert html_response(conn, 200) =~ "New Count"
    end
  end

  describe "create count" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.count_path(conn, :create), count: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.count_path(conn, :show, id)

      conn = get(conn, Routes.count_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Count"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.count_path(conn, :create), count: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Count"
    end
  end

  describe "edit count" do
    setup [:create_count]

    test "renders form for editing chosen count", %{conn: conn, count: count} do
      conn = get(conn, Routes.count_path(conn, :edit, count))
      assert html_response(conn, 200) =~ "Edit Count"
    end
  end

  describe "update count" do
    setup [:create_count]

    test "redirects when data is valid", %{conn: conn, count: count} do
      conn = put(conn, Routes.count_path(conn, :update, count), count: @update_attrs)
      assert redirected_to(conn) == Routes.count_path(conn, :show, count)

      conn = get(conn, Routes.count_path(conn, :show, count))
      assert html_response(conn, 200)
    end

    test "renders errors when data is invalid", %{conn: conn, count: count} do
      conn = put(conn, Routes.count_path(conn, :update, count), count: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Count"
    end
  end

  describe "delete count" do
    setup [:create_count]

    test "deletes chosen count", %{conn: conn, count: count} do
      conn = delete(conn, Routes.count_path(conn, :delete, count))
      assert redirected_to(conn) == Routes.count_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.count_path(conn, :show, count))
      end
    end
  end

  defp create_count(_) do
    count = fixture(:count)
    %{count: count}
  end
end
