defmodule GrabCikguApiWeb.TutorProfileController do
  use GrabCikguApiWeb, :controller
  alias GrabCikguApi.Tutors
  alias GrabCikguApi.Tutors.{Tutor, TutorProfile}

  def show(conn, _params) do
    tutor = conn.assigns.current_user
    render(conn, "show.json", %{tutor: tutor})
  end

  def update(conn, params) do
    tutor = conn.assigns.current_user

    with {:ok, tutor} <- Tutors.update_tutor(tutor, params) do
      render(conn, "show.json", %{tutor: tutor})
    end
  end
end
