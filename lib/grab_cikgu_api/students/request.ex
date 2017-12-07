defmodule GrabCikguApi.Students.Requests.Request do
  use Ecto.Schema
  import Ecto.Changeset
  alias GrabCikguApi.Tutors.{Tutor}
  alias GrabCikguApi.Students.{Student}
  alias GrabCikguApi.Students.Requests
  alias Requests.Request

  schema "requests" do
    field :remarks, :string
    belongs_to :tutor, Tutor
    belongs_to :student, Student
  end

  @all_attrs [:remarks]

  def changeset(%Request{} = request, attrs) do
    request
    |> cast(attrs, @all_attrs)
    |> validate_required([:tutor_id, :student_id])
  end

  def put_tutor_and_student(changeset, tutor, student) do
    tc = tutor |> Tutor.changeset
    sc = student |> Student.changeset
    changeset
    |> put_assoc(:tutor, tutor)
    |> put_assoc(:student, student)
  end
end
