defmodule GrabCikguApi.Repo.Migrations.UniqueStudentsEmail do
  use Ecto.Migration

  def change do
    create unique_index(:students, [:email])
  end
end
