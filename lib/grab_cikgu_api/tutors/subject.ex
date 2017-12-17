defmodule GrabCikguApi.Tutors.Subject do
	use Ecto.Schema
	import Ecto.Changeset

	schema "subjects" do
	  field :name, :string
	  field :level, :string

	  timestamps()
	end

  @all_attrs [:name, :level]

	def changeset(%__MODULE__{} = subject, attrs) do
		subject
		|> cast(attrs, @all_attrs)
	end

end