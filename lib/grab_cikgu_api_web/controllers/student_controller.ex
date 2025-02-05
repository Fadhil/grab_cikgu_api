defmodule GrabCikguApiWeb.StudentController do
  use GrabCikguApiWeb, :controller

  alias GrabCikguApi.Students
  alias GrabCikguApi.Students.Student

  action_fallback GrabCikguApiWeb.FallbackController

  # def index(conn, _params) do
  #   tutors = Students.list_tutors()
  #   render(conn, "index.json", tutors: tutors)
  # end

  def create(conn, %{"student" => student_params}) do
    with {:ok, %Student{} = student} <- Students.create_student(student_params) do
      conn
      |> put_status(:created)
      |> render("show.json", student: student)
    end
  end

  # def show(conn, %{"id" => id}) do
  #   tutor = Tutors.get_tutor!(id)
  #   render(conn, "show.json", tutor: tutor)
  # end
  #
  # def update(conn, %{"id" => id, "tutor" => tutor_params}) do
  #   tutor = Tutors.get_tutor!(id)
  #
  #   with {:ok, %Tutor{} = tutor} <- Tutors.update_tutor(tutor, tutor_params) do
  #     render(conn, "show.json", tutor: tutor)
  #   end
  # end
  #
  # def delete(conn, %{"id" => id}) do
  #   tutor = Tutors.get_tutor!(id)
  #   with {:ok, %Tutor{}} <- Tutors.delete_tutor(tutor) do
  #     send_resp(conn, :no_content, "")
  #   end
  # end
end
