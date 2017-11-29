defmodule GrabCikguApi.Repo.Migrations.AddUserAssocToProfiles do
  use Ecto.Migration

  def change do
    alter table(:profiles) do
      add :tutor_id, references(:tutors)
    end
  end
end
