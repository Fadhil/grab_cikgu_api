defmodule GrabCikguApi.Repo.Migrations.AddHourlyRateTutor do
  use Ecto.Migration

  def change do
  	 alter table(:profiles) do
      add :hourlyRate, :string
    end
  end
end
