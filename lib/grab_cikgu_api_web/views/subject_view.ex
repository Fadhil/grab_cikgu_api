defmodule GrabCikguApiWeb.SubjectView do
	use GrabCikguApiWeb, :view

	def render("index.json", %{subjects: subjects}) do
	  %{data: render_many(subjects, __MODULE__, "subject.json")}
	end

	def render("show.json", %{subject: subject}) do
	  %{data: render_one(subject, __MODULE__, "subject.json")}
	end

	def render("subject.json", %{subject: subject}) do
	  %{id: subject.id,
	  	name: subject.name,
	  	level: subject.level
	  }
	end
end