defmodule GrabCikguApi.Repo.Migrations.AddEmailToTutors do
  use Ecto.Migration

  def change do
    alter table(:tutors) do
      add :email, :string
    end
  end
end
