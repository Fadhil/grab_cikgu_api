defmodule GrabCikguApiWeb.TutorController do
  use GrabCikguApiWeb, :controller

  alias GrabCikguApi.Tutors
  alias GrabCikguApi.Tutors.Tutor

  action_fallback GrabCikguApiWeb.FallbackController

  def index(conn, %{"state" => state}) do
    tutors = Tutors.list_tutors(state)
    render(conn, "index.json", tutors: tutors)
  end

  def index(conn, _params) do
    tutors = Tutors.list_tutors()
    render(conn, "index.json", tutors: tutors)
  end

  def create(conn, %{"tutor" => tutor_params}) do
    with {:ok, %Tutor{} = tutor} <- Tutors.create_tutor(tutor_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", tutor_path(conn, :show, tutor))
      |> render("show.json", tutor: tutor)
    end
  end

  def show(conn, %{"id" => id}) do
    id = String.to_integer(id)
    tutor = Tutors.get_tutor!(id)
    render(conn, "show.json", tutor: tutor)
  end

  def update(conn, %{"id" => id, "tutor" => tutor_params}) do
    tutor = Tutors.get_tutor!(id)

    with {:ok, %Tutor{} = tutor} <- Tutors.update_tutor(tutor, tutor_params) do
      render(conn, "show.json", tutor: tutor)
    end
  end

  def delete(conn, %{"id" => id}) do
    tutor = Tutors.get_tutor!(id)
    with {:ok, %Tutor{}} <- Tutors.delete_tutor(tutor) do
      send_resp(conn, :no_content, "")
    end
  end
end
