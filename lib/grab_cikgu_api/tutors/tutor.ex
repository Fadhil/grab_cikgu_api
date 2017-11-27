defmodule GrabCikguApi.Tutors.Tutor do
  use Ecto.Schema
  import Ecto.Changeset
  alias GrabCikguApi.Tutors.Tutor


  schema "tutors" do
    field :name, :string
    field :email, :string, unique: true
    field :username, :string
    field :password, :string, virtual: true
    field :password_hash, :string

    timestamps()
  end

  @all_attrs [:name, :email, :username, :password, :password_hash]
  @required_attrs [:name, :email, :password]
  @doc false

  def registration_changeset(%Tutor{} = tutor, attrs) do
    tutor
    |> cast(attrs, @all_attrs)
    |> validate_required(@required_attrs)
    |> unique_constraint(:email)
    |> validate_length(:email, min: 1, max: 255)
    |> validate_format(:email, ~r/@/)
    |> put_password_hash()
  end

  def changeset(%Tutor{} = tutor, attrs) do
    tutor
    |> cast(attrs, @all_attrs)
    |> validate_required([:name, :email, :password])
    |> unique_constraint(:email)
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
