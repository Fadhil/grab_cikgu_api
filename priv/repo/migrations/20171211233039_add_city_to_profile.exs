defmodule GrabCikguApi.Repo.Migrations.AddCityToProfile do
  use Ecto.Migration

  def change do
    alter table(:profiles) do
      add :city, :string
    end
  end
end
