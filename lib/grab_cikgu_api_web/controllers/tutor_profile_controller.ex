defmodule GrabCikguApiWeb.TutorProfileController do
  use GrabCikguApiWeb, :controller

  def show(conn, _params) do
    tutor = conn.assigns.current_user
    render(conn, "show.json", %{tutor: tutor})
  end

end
