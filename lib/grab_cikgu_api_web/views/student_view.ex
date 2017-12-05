defmodule GrabCikguApiWeb.StudentView do
use GrabCikguApiWeb, :view

  def render("show.json", %{student: student}) do
    %{id: student.id,
      name: student.name,
      email: student.email
    }
  end
end
