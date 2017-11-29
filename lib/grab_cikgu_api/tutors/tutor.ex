defmodule GrabCikguApi.Tutors.Tutor do
  use Ecto.Schema
  import Ecto.Changeset
  alias GrabCikguApi.Tutors.{Tutor, TutorProfile}


  schema "tutors" do
    field :email, :string, unique: true
    field :username, :string
    field :password, :string, virtual: true
    field :password_hash, :string
    field :token, :string

    has_one :profile, TutorProfile

    timestamps()
  end

  @all_attrs [:email, :username, :password, :password_hash]
  @required_attrs [:email, :password]
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
    |> validate_required(@required_attrs)
    |> unique_constraint(:email)
  end

  def update_token_changeset(%Tutor{} = tutor, token_attr) do
    tutor
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
