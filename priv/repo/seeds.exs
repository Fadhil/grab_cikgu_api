# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     GrabCikguApi.Repo.insert!(%GrabCikguApi.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

defmodule GrabCikguApi.DatabaseSeeder do

alias GrabCikguApi.Repo
alias GrabCikguApi.Tutors.{Subject}
alias GrabCikguApi.Tutors

 subjects = [%{name: "Bahasa Malaysia", level: "Standard 1-3"},
 			       %{name: "Bahasa Inggeris", level: "Standard 1-3"},
 			       %{name: "Bahasa Cina", level: "Standard 1-3"},
 			       %{name: "Mathematics", level: "Standard 1-3"},
 			       %{name: "Science", level: "Standard 1-3"},

             %{name: "Bahasa Malaysia", level: "Standard 4-6"},
 			       %{name: "Bahasa Inggeris", level: "Standard 4-6"},
 			       %{name: "Bahasa Cina", level: "Standard 4-6"},
 			       %{name: "Mathematics", level: "Standard 4-6"},
 			       %{name: "Science", level: "Standard 4-6"},

             %{name: "Bahasa Malaysia", level: "Form 1-3"},
 			       %{name: "Bahasa Inggeris", level: "Form 1-3"},
 			       %{name: "Bahasa Cina", level: "Form 1-3"},
 			       %{name: "Mathematics", level: "Form 1-3"},
 			       %{name: "Science", level: "Form 1-3"},
             %{name: "Geography", level: "Form 1-3"},
 			       %{name: "History", level: "Form 1-3"},

             %{name: "Bahasa Malaysia", level: "Form 4-5"},
 			       %{name: "Bahasa Inggeris", level: "Form 4-5"},
 			       %{name: "Bahasa Cina", level: "Form 4-5"},
 			       %{name: "Mathematics", level: "Form 4-5"},
 			       %{name: "Science", level: "Form 4-5"},
             %{name: "Geography", level: "Form 4-5"},
 			       %{name: "History", level: "Form 4-5"},
             %{name: "Principle Accounts", level: "Form 4-5"},
 			       %{name: "Economics", level: "Form 4-5"},
 			       %{name: "Business", level: "Form 4-5"},
             %{name: "Biology", level: "Form 4-5"},
 			       %{name: "Physics", level: "Form 4-5"},
             %{name: "Chemistry", level: "Form 4-5"},
 			       %{name: "Additional Mathematics", level: "Form 4-5"}
           ]


 for subject <- subjects do
 	case Tutors.get_subject(subject.name, subject.level) do
    nil ->
  		 {:ok, subject} = Subject.changeset(%Subject{name: subject.name , level: subject.level}, %{}) |> Repo.insert
       IO.puts "Created subject " <> subject.name <> " for level " <> subject.level
    subject ->
       IO.puts "Subject " <> subject.name <> " exists for level " <> subject.level

  end
 end


end
