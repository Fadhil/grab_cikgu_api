defmodule GrabCikguApiWeb.Router do
  use GrabCikguApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", GrabCikguApiWeb do
    pipe_through :api

    resources "/tutors", TutorController
    get "/tutor/profile", TutorProfileController, :show
    post "/sessions", SessionController, :create
  end
end
