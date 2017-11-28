defmodule GrabCikguApiWeb.TutorProfileController do
  use GrabCikguApiWeb, :controller

  def show(conn, _params) do
    render(conn, "show.json", %{})
  end

end
