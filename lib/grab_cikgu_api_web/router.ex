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
    post "/sessions", SessionController, :create

    pipe_through :authorised
    get "/tutor/profile", TutorProfileController, :show
  end
end
