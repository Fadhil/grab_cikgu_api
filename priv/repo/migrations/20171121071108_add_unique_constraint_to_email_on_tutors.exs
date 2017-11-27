defmodule GrabCikguApi.Repo.Migrations.AddUniqueConstraintToEmailOnTutors do
  use Ecto.Migration

  def change do
    create unique_index(:tutors, [:email])
  end
end
