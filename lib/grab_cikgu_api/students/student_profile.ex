defmodule GrabCikguApi.Students.StudentProfile do
  use Ecto.Schema
  import Ecto.Changeset
  alias GrabCikguApi.Students.{Student, StudentProfile}

  schema "profiles" do
    field :full_name, :string

    belongs_to :student, Student
  end
end
