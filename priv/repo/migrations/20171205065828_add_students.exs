defmodule GrabCikguApi.Repo.Migrations.AddStudents do
  use Ecto.Migration

  def change do
    create table(:students) do
      add :email, :string
      add :password_hash, :string
      add :name, :string
    end
  end
end
