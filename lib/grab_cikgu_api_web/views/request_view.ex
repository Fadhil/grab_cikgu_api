defmodule GrabCikguApiWeb.RequestView do
  use GrabCikguApiWeb, :view

  def render("index.json", %{requests: requests}) do
    %{data: render_many(requests, __MODULE__, "request.json")}
  end

  def render("show.json", %{request: request}) do
    %{data: render_one(request, __MODULE__, "request.json")}
  end

  def render("request.json", %{request: request}) do
    %{
      id: request.id,
      tutor_id: request.tutor_id,
      student_id: request.student_id,
      remarks: request.remarks,
      tutor_name: request.tutor.profile.full_name,
      student_name: request.student.name
    }
  end
end
