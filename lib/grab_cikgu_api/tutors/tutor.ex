defmodule GrabCikguApi.Tutors.Tutor do
  use Ecto.Schema
  import Ecto.Changeset
  alias GrabCikguApi.Tutors.Tutor


  schema "tutors" do
    field :name, :string
    field :email, :string, unique: true
    field :username, :string

    timestamps()
  end

  @all_attrs [:name, :email, :username]
  @doc false
  def changeset(%Tutor{} = tutor, attrs) do
    tutor
    |> cast(attrs, @all_attrs)
    |> validate_required([:name, :email])
    |> unique_constraint(:email)
  end
end
