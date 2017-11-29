defmodule GrabCikguApiWeb.TutorProfileView do
use GrabCikguApiWeb, :view
  def render("show.json", %{}) do
    %{id: 1,
      name: "testing``",
      email: "email@gmail.com"}
  end
end
