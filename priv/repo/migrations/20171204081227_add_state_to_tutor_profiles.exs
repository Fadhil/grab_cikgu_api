defmodule GrabCikguApi.Repo.Migrations.AddStateToTutors do
  use Ecto.Migration

  def change do
    alter table(:profiles) do
      add :state, :string
    end
  end
end
