defmodule GrabCikguApiWeb.SearchController do
  use GrabCikguApiWeb, :controller

  alias GrabCikguApi.Tutors
  alias GrabCikguApi.Tutors.Tutor

  action_fallback GrabCikguApiWeb.FallbackController

  def search(conn, params) do
    tutors = Tutors.list_tutors()
    render(conn, "index.json", tutors: tutors)

  end

end
