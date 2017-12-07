defmodule GrabCikguApiWeb.RequestView do
  use GrabCikguApiWeb, :view

  def render("show.json", %{request: request}) do
    %{data: render_one(request, __MODULE__, "request.json")}
  end

  def render("request.json", %{request: request}) do
    %{
      id: request.id,
      tutor_id: request.tutor_id,
      student_id: request.student_id,
      remarks: request.remarks
    }
  end
end
