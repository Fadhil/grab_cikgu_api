defmodule GrabCikguApi.Students.Requests do
  alias GrabCikguApi.Students.Requests.Request
  alias GrabCikguApi.Tutors.Tutor
  alias GrabCikguApi.Students.Student
  alias GrabCikguApi.Repo
  @doc """
  Makes a new request based on the student_id and tutor_id
  """
  def create(student, tutor, attrs) do
    %Request{}
    |> Request.changeset(attrs)
    |> Request.put_tutor_and_student(tutor, student)
    |> Repo.insert()
  end

  def list_requests() do
    Repo.all(Request) |> Repo.preload([:tutor, :student])
  end
end
