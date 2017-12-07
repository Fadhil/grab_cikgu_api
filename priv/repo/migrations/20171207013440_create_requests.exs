defmodule GrabCikguApi.Repo.Migrations.CreateRequests do
  use Ecto.Migration

  def change do
    create table(:requests) do
      add :tutor_id, references(:tutors, on_delete: :delete_all)
      add :student_id, references(:students, on_delete: :delete_all)
      add :remarks, :string

      timestamps()
    end
  end
end
