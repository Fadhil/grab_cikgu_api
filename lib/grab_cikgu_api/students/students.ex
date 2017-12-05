defmodule GrabCikguApi.Students do

  import Ecto.Query, warn: false
  import SecureRandom, only: [ urlsafe_base64: 0 ]
  alias GrabCikguApi.Repo

  alias GrabCikguApi.Students.{Student}

  def create_student(attrs \\ %{}) do
    %Student{}
    |> Student.registration_changeset(attrs)
    |> Repo.insert()
  end

  def get_student!(id) when is_integer(id), do: Repo.get!(Student, id)

  def get_student(email) when is_bitstring(email) do
    Repo.get_by(Student, %{email: email})
  end

  def update_token(%Student{} = student) do
    token = urlsafe_base64()
    student
    |> Student.update_token_changeset(%{token: token})
    |> Repo.update
  end

  def get_student_by_token(%{token: _token} = attrs) do
    Repo.get_by(Student, attrs) |> Repo.preload(:profile)
  end
end
