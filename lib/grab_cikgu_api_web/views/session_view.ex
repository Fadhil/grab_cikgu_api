defmodule GrabCikguApiWeb.SessionView do
  use GrabCikguApiWeb, :view

  def render("show.json", %{session_token: token}) do
    %{data: %{token: token}}
  end

  def render("error.json", _tutor_params) do
    %{errors: %{detail: "Failed to authenticate"}}
  end
end
