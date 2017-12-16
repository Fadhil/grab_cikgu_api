defmodule GrabCikguApiWeb.Router do
  use GrabCikguApiWeb, :router
  alias GrabCikguApiWeb.Plugs.Authorisation

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :authorised do
    plug Authorisation
  end

  scope "/api", GrabCikguApiWeb do
    pipe_through :api

    resources "/tutors", TutorController
    resources "/students", StudentController
    post "/sessions", SessionController, :create
    resources "/subjects", SubjectController

    pipe_through :authorised
    get "/tutor/profile", TutorProfileController, :show
    put "/tutor/profile", TutorProfileController, :update
    resources "/requests", RequestController
  end
end
