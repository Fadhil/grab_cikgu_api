defmodule GrabCikguApiWeb.TutorView do
  use GrabCikguApiWeb, :view
  alias GrabCikguApiWeb.TutorView

  def render("index.json", %{tutors: tutors}) do
    %{data: render_many(tutors, TutorView, "tutor.json")}
  end

  def render("show.json", %{tutor: tutor}) do
    %{data: render_one(tutor, TutorView, "tutor.json")}
  end

  def render("tutor.json", %{tutor: tutor}) do
    %{id: tutor.id,
      name: tutor.name,
      username: tutor.username}
  end
end
