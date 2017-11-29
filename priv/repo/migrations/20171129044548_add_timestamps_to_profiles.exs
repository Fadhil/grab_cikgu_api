defmodule GrabCikguApi.Repo.Migrations.AddTimestampsToProfiles do
  use Ecto.Migration

  def change do
    alter table(:profiles) do
      timestamps
    end
  end
end
