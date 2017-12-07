defmodule GrabCikguApi.Repo.Migrations.AddStudentsToProfiles do
  use Ecto.Migration

  def change do
    alter table(:profiles) do
      add :student_id, references(:students, on_delete: :delete_all)
    end
  end
end
