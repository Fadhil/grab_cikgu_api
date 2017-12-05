defmodule GrabCikguApiWeb.TutorControllerTest do
  use GrabCikguApiWeb.ConnCase

  alias GrabCikguApi.Tutors
  alias GrabCikguApi.Tutors.Tutor

  @create_attrs %{name: "some name", username: "some username"}
  @update_attrs %{name: "some updated name", username: "some updated username"}
  @invalid_attrs %{name: nil, username: nil}

  def fixture(:tutor) do
    {:ok, tutor} = Tutors.create_tutor(@create_attrs)
    tutor
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all tutors", %{conn: conn} do
      conn = get conn, tutor_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create tutor" do
    test "renders tutor when data is valid", %{conn: conn} do
      conn = post conn, tutor_path(conn, :create), tutor: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, tutor_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "name" => "some name",
        "username" => "some username"}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, tutor_path(conn, :create), tutor: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update tutor" do
    setup [:create_tutor]

    test "renders tutor when data is valid", %{conn: conn, tutor: %Tutor{id: id} = tutor} do
      conn = put conn, tutor_path(conn, :update, tutor), tutor: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, tutor_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "name" => "some updated name",
        "username" => "some updated username"}
    end

    test "renders errors when data is invalid", %{conn: conn, tutor: tutor} do
      conn = put conn, tutor_path(conn, :update, tutor), tutor: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete tutor" do
    setup [:create_tutor]

    test "deletes chosen tutor", %{conn: conn, tutor: tutor} do
      conn = delete conn, tutor_path(conn, :delete, tutor)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, tutor_path(conn, :show, tutor)
      end
    end
  end

  defp create_tutor(_) do
    tutor = fixture(:tutor)
    {:ok, tutor: tutor}
  end
end
