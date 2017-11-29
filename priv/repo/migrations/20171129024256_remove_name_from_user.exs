defmodule GrabCikguApi.Repo.Migrations.RemoveNameFromUser do
  use Ecto.Migration

  def up do
    alter table(:tutors) do
      remove :name
    end
  end

  def down do
    alter table(:tutors) do
      add :name, :string
    end
  end
end
