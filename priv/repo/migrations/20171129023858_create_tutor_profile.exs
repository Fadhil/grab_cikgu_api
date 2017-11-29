defmodule GrabCikguApi.Repo.Migrations.CreateTutorProfile do
  use Ecto.Migration

  def change do
    create table(:profiles) do
      add :full_name, :string
      add :ic_no, :string
      add :gender, :string
      add :age, :integer
      add :occupation, :string
      add :address, :string
      add :phone_no, :string
      add :tutor_license_no, :string
      add :qualification, :string
      add :achievement, :string
      add :experience, :string
      add :description, :string
      add :area_covered, :string
      add :hourly_rate_cents, :integer
      add :availability, :string
      add :teach_in_center, :boolean
      add :bank_acc_name, :string
      add :bank_acc_no, :string
      add :bank_name, :string
    end
  end
end
