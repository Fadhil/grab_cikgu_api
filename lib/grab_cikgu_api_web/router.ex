defmodule GrabCikguApiWeb.Router do
  use GrabCikguApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", GrabCikguApiWeb do
    pipe_through :api
  end
end
