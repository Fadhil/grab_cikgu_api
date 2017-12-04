defmodule GrabCikguApi.Repo.Migrations.AddSubjectsToProfiles do
  use Ecto.Migration

  def change do
    alter table(:profiles) do
      add :subjects, :string
    end
  end
end
