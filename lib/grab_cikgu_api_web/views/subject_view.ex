defmodule GrabCikguApiWeb.SubjectView do
	use GrabCikguApiWeb, :view

	def render("index.json", %{subjects: subjects}) do
	%{name: "izah", age: subjects}
	end
end