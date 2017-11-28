defmodule GrabCikguApi.Repo.Migrations.AddFieldsToTutors do
  use Ecto.Migration

  def change do
    alter table(:tutors) do
      add :ic_no, :string
      add :gender, :string
      add :age, :integer
      add :occupation, :string
      add :tutor_status, :string
      add :address, :string
      add :tutor_license, :string
      add :mobile_no, :string
      add :qualifications, :string
      add :achievements, :string
      add :experience, :string
      add :description, :string
      add :subjects, :string
      add :area_covered, :string
      add :hourly_rate_cents, :integer
      add :availability, :string
      add :can_teach_at_center, :boolean
      add :rating, :float
      add :credit_hours, :float
    end
  end
end
