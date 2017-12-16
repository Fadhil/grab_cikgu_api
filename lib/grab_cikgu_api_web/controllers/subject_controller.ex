defmodule GrabCikguApiWeb.SubjectController do
	use GrabCikguApiWeb, :controller

	alias GrabCikguApi.Tutors


	def index(conn, _params) do
	subjects = Tutors.list_subjects()
	render(conn, "index.json", subjects: subjects)

	end

end