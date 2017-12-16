defmodule GrabCikguApiWeb.TutorProfileView do
use GrabCikguApiWeb, :view
  def render("show.json", %{tutor: tutor}) do
    %{id: tutor.id,
      name: tutor.profile.full_name,
      email: tutor.email,
      ic_no: tutor.profile.ic_no,
      gender: tutor.profile.gender,
      age: tutor.profile.age,
      occupation: tutor.profile.occupation,
      address: tutor.profile.address,
      state: tutor.profile.state,
      city: tutor.profile.city,
      phone_no: tutor.profile.phone_no,
      tutor_license_no: tutor.profile.tutor_license_no,
      qualification: tutor.profile.qualification,
      achievement: tutor.profile.achievement,
      experience: tutor.profile.experience,
      description: tutor.profile.description,
      subjects: tutor.profile.subjects,
      area_covered: tutor.profile.description,
      hourly_rate_cents: tutor.profile.hourly_rate_cents,
      availability: tutor.profile.availability,
      teach_in_center: tutor.profile.teach_in_center,
      bank_acc_name: tutor.profile.bank_acc_name,
      bank_acc_no: tutor.profile.bank_acc_no,
      bank_name: tutor.profile.bank_name
    }
  end
end
