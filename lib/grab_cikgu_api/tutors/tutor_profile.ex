defmodule GrabCikguApi.Tutors.TutorProfile do
  use Ecto.Schema
  import Ecto.Changeset
  alias GrabCikguApi.Tutors.{Tutor, TutorProfile}

  schema "profiles" do
    field :full_name, :string
    field :ic_no, :string
    field :gender, :string
    field :age, :integer
    field :occupation, :string
    field :address, :string
    field :state, :string
    field :phone_no, :string
    field :tutor_license_no, :string
    field :qualification, :string
    field :achievement, :string
    field :experience, :string
    field :description, :string
    field :subjects, :string
    field :area_covered, :string
    field :hourly_rate_cents, :integer
    field :availability, :string
    field :teach_in_center, :boolean
    field :bank_acc_name, :string
    field :bank_acc_no, :string
    field :bank_name, :string

    belongs_to :tutor, Tutor

    timestamps()
  end

  @all_attrs [:full_name, :ic_no, :gender, :age, :occupation, :address,
    :phone_no, :tutor_license_no, :qualification, :achievement, :experience,
    :description, :area_covered, :hourly_rate_cents, :availability,
    :teach_in_center, :bank_acc_name, :bank_acc_name, :bank_name, :state,
    :subjects
  ]

  def new_changeset(%TutorProfile{} = profile, attrs) do
    profile
    |> cast(attrs, @all_attrs)
  end

  def changeset(%TutorProfile{} = profile, attrs) do
    new_changeset(profile, attrs)
  end
end
