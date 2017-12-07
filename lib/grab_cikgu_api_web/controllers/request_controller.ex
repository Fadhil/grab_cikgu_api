defmodule GrabCikguApiWeb.RequestController do
  use GrabCikguApiWeb, :controller

  alias GrabCikguApi.Tutors.Tutor
  alias GrabCikguApi.Students.Student
  alias GrabCikguApi.Students.Requests
  alias GrabCikguApi.Students.Requests.Request

  action_fallback GrabCikguApiWeb.FallbackController

  def create(conn, %{"request" => request_params}) do
    require IEx; IEx.pry

    student = conn.assigns.current_user
    tutor = request_params["tutor_id"]
    with {:ok, %Request{} = request} <- Requests.create(student, tutor, request_params) do
      conn
      |> put_status(:created)
      |> render("show.json", request: request)
    end
  end
end
