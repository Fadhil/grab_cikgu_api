defmodule GrabCikguApi.Students.Student do
  use Ecto.Schema
  import Ecto.Changeset
  alias GrabCikguApi.Students.{Student}

  schema "students" do
    field :name, :string
    field :email, :string, unique: true
    field :password, :string, virtual: true
    field :password_hash, :string
    field :token, :string

    timestamps()
  end

  @all_attrs [:name, :email, :password]
  @required_attrs [:name, :email, :password]

  def registration_changeset(%Student{} = student, attrs) do
    student
    |> cast(attrs, @all_attrs)
    |> validate_required(@required_attrs)
    |> unique_constraint(:email)
    |> validate_length(:email, min: 1, max: 255)
    |> validate_format(:email, ~r/@/)
    |> put_password_hash()
  end

  def update_token_changeset(%Student{} = student, token_attr) do
    student
    |> cast(token_attr,[:token])
  end

  def put_password_hash(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{password: pass}} ->
        put_change(changeset, :password_hash, Comeonin.Bcrypt.hashpwsalt(pass))
      _ ->
        changeset
    end
  end

end
