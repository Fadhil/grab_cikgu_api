defmodule GrabCikguApiWeb.RequestController do
  use GrabCikguApiWeb, :controller

  alias GrabCikguApi.Tutors
  alias GrabCikguApi.Tutors.Tutor
  alias GrabCikguApi.Students.Student
  alias GrabCikguApi.Students.Requests
  alias GrabCikguApi.Students.Requests.Request

  action_fallback GrabCikguApiWeb.FallbackController

  def index(conn, _params) do
    requests = Requests.list_requests()
    render(conn, "index.json", requests: requests)
  end

  def create(conn, %{"request" => request_params}) do
    student = conn.assigns.current_user
    tutor_id = request_params["tutor_id"]
    tutor = Tutors.get_tutor!(tutor_id)

    with {:ok, %Request{} = request} <- Requests.create(student, tutor, request_params) do
      conn
      |> put_status(:created)
      |> render("show.json", request: request)
    end
  end
end
