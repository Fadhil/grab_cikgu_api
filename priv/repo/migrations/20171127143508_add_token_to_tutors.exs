defmodule GrabCikguApi.Repo.Migrations.AddTokenToTutors do
  use Ecto.Migration

  def change do
    alter table(:tutors) do
      add :token, :string
    end
    create index(:tutors, [:token])
  end
end
