defmodule GrabCikguApi.Tutors.Tutor do
  use Ecto.Schema
  import Ecto.Changeset
  alias GrabCikguApi.Tutors.Tutor


  schema "tutors" do
    field :name, :string
    field :username, :string

    timestamps()
  end

  @doc false
  def changeset(%Tutor{} = tutor, attrs) do
    tutor
    |> cast(attrs, [:name, :username])
    |> validate_required([:name, :username])
  end
end
