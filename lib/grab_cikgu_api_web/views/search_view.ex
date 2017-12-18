defmodule GrabCikguApiWeb.SearchView do
  use GrabCikguApiWeb, :view

  def render("index.json", %{tutors: tutors}) do
	  %{data: render_many(tutors, __MODULE__, "tutor.json", as: :tutor)}
	end

	def render("show.json", %{tutor: tutor}) do
	  %{data: render_one(tutor, __MODULE__, "tutor.json", as: :tutor)}
	end

	def render("tutor.json", %{tutor: tutor}) do
	  %{name: tutor.profile.full_name,
      subjects: tutor.profile.subjects}
	end
end
