defmodule GrabCikguApi.Tutors do
  @moduledoc """
  The Tutors context.
  """

  import Ecto.Query, warn: false
  import SecureRandom, only: [ urlsafe_base64: 0 ]
  alias GrabCikguApi.Repo

  alias GrabCikguApi.Tutors.{Tutor, TutorProfile}

  @doc """
  Returns the list of tutors. If given a state string, returns a list
  of tutors from that state.

  ## Examples

      iex> list_tutors()
      [%Tutor{}, ...]

  """
  def list_tutors do
    Repo.all(Tutor) |> Repo.preload(:profile)
  end

  def list_tutors(state) do
    query =
      from t in Tutor,
      join: p in assoc(t, :profile),
      where: p.state == ^state

    Repo.all(query) |> Repo.preload(:profile)
  end



  @doc """
  Gets a user by token
  """
  def get_tutor_by_token(%{token: _token} = attrs) do
    Repo.get_by(Tutor, attrs) |> Repo.preload(:profile)
  end

  @doc """
  Gets a single tutor.

  Raises `Ecto.NoResultsError` if the Tutor does not exist.

  ## Examples

      iex> get_tutor!(123)
      %Tutor{}

      iex> get_tutor!(456)
      ** (Ecto.NoResultsError)

  """
  def get_tutor!(id) when is_integer(id) do
    Repo.get!(Tutor, id)
    |> Repo.preload(:profile)
  end

  def get_tutor(email) when is_bitstring(email) do
    Repo.get_by(Tutor, %{email: email})
  end

  @doc """
  Creates a tutor.

  ## Examples

      iex> create_tutor(%{field: value})
      {:ok, %Tutor{}}

      iex> create_tutor(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_tutor(attrs \\ %{}) do
    %Tutor{}
    |> Tutor.registration_changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a tutor.

  ## Examples

      iex> update_tutor(tutor, %{field: new_value})
      {:ok, %Tutor{}}

      iex> update_tutor(tutor, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_token(%Tutor{} = tutor) do
    token = urlsafe_base64()
    tutor
    |> Tutor.update_token_changeset(%{token: token})
    |> Repo.update
  end

  def update_tutor(%Tutor{} = tutor, params) do

    {tutor_params, profile_params} =
      params
      |> Map.split(["email", "name"])

    profile_changeset = TutorProfile.changeset(tutor.profile, profile_params)
    tutor_changeset =
      Tutor.changeset(tutor, tutor_params)
      |> Ecto.Changeset.put_assoc(:profile, profile_changeset)
      |> Repo.update()
  end

  @doc """
  Deletes a Tutor.

  ## Examples

      iex> delete_tutor(tutor)
      {:ok, %Tutor{}}

      iex> delete_tutor(tutor)
      {:error, %Ecto.Changeset{}}

  """
  def delete_tutor(%Tutor{} = tutor) do
    Repo.delete(tutor)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking tutor changes.

  ## Examples

      iex> change_tutor(tutor)
      %Ecto.Changeset{source: %Tutor{}}

  """
  def change_tutor(%Tutor{} = tutor) do
    Tutor.changeset(tutor, %{})
  end
end
