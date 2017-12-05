defmodule GrabCikguApi.Repo.Migrations.AddTokenToStudents do
  use Ecto.Migration

  def change do
    alter table(:students) do
      add :token, :string
    end
  end
end
