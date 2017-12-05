defmodule GrabCikguApi.Repo.Migrations.AddPasswordHashToTutors do
  use Ecto.Migration

  def change do
    alter table(:tutors) do
      add :password_hash, :string
    end
  end
end
