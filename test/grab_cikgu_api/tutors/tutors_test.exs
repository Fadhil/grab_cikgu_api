defmodule GrabCikguApi.TutorsTest do
  use GrabCikguApi.DataCase

  alias GrabCikguApi.Tutors

  describe "tutors" do
    alias GrabCikguApi.Tutors.Tutor

    @valid_attrs %{name: "some name", username: "some username",
     email: "some@email.com", gender: "Female", occupation: "Teacher"}

    @update_attrs %{name: "some updated name", username: "some updated username",
     occupation: "new occupation"}

    @invalid_attrs %{name: nil, email: nil}

    def tutor_fixture(attrs \\ %{}) do
      {:ok, tutor} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Tutors.create_tutor()

      tutor
    end

    test "list_tutors/0 returns all tutors" do
      tutor = tutor_fixture()
      assert Tutors.list_tutors() == [tutor]
    end

    test "get_tutor!/1 returns the tutor with given id" do
      tutor = tutor_fixture()
      assert Tutors.get_tutor!(tutor.id) == tutor
    end

    test "create_tutor/1 with valid data creates a tutor" do
      assert {:ok, %Tutor{} = tutor} = Tutors.create_tutor(@valid_attrs)
      assert tutor.name == "some name"
      assert tutor.username == "some username"
    end

    test "create_tutor/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Tutors.create_tutor(@invalid_attrs)
    end

    test "registering an email twice returns an error changeset" do
      assert {:ok, %Tutor{} = tutor} = Tutors.create_tutor(@valid_attrs)
      assert {:error, %Ecto.Changeset{}} = Tutors.create_tutor(@valid_attrs)
    end


    test "update_tutor/2 with valid data updates the tutor" do
      tutor = tutor_fixture()
      assert {:ok, tutor} = Tutors.update_tutor(tutor, @update_attrs)
      assert %Tutor{} = tutor
      assert tutor.name == "some updated name"
      assert tutor.username == "some updated username"
    end

    test "update_tutor/2 with invalid data returns error changeset" do
      tutor = tutor_fixture()
      assert {:error, %Ecto.Changeset{}} = Tutors.update_tutor(tutor, @invalid_attrs)
      assert tutor == Tutors.get_tutor!(tutor.id)
    end

    test "delete_tutor/1 deletes the tutor" do
      tutor = tutor_fixture()
      assert {:ok, %Tutor{}} = Tutors.delete_tutor(tutor)
      assert_raise Ecto.NoResultsError, fn -> Tutors.get_tutor!(tutor.id) end
    end

    test "change_tutor/1 returns a tutor changeset" do
      tutor = tutor_fixture()
      assert %Ecto.Changeset{} = Tutors.change_tutor(tutor)
    end
  end
end
