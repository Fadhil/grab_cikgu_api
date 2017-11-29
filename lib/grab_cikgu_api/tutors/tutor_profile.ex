defmodule GrabCikguApi.Tutors.TutorProfile do
  use Ecto.Schema
  import Ecto.Changeset
  alias GrabCikguApi.Tutors.Tutor

  schema "profiles" do
    field :full_name, :string
    field :ic_no, :string
    field :gender, :string
    field :age, :integer
    field :occupation, :string
    field :fieldress, :string
    field :phone_no, :string
    field :tutor_license_no, :string
    field :qualification, :string
    field :achievement, :string
    field :experience, :string
    field :description, :string
    field :area_covered, :string
    field :hourly_rate_cents, :integer
    field :availability, :string
    field :teach_in_center, :boolean
    field :bank_acc_name, :string
    field :bank_acc_no, :string
    field :bank_name, :string

    timestamps()
  end
end
