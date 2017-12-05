defmodule GrabCikguApi.Repo.Migrations.AddTimestampsToStudents do
  use Ecto.Migration

  def change do
    alter table(:students) do
      timestamps() 
    end
  end
end
