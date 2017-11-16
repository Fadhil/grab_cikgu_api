defmodule GrabCikguApi.Repo.Migrations.CreateTutors do
  use Ecto.Migration

  def change do
    create table(:tutors) do
      add :name, :string
      add :username, :string

      timestamps()
    end

  end
end
