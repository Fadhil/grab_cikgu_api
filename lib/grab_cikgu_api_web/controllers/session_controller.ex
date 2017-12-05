defmodule GrabCikguApiWeb.SessionController do
  use GrabCikguApiWeb, :controller

  alias GrabCikguApi.Tutors
  alias GrabCikguApi.Tutors.Tutor

  import Comeonin.Bcrypt, only: [checkpw: 2, dummy_checkpw: 0]

  def create(conn, %{"tutor" => tutor_params}) do
    tutor= Tutors.get_tutor(tutor_params["email"])
    cond do
      tutor && checkpw(tutor_params["password"], tutor.password_hash) ->
        {:ok, %Tutor{token: session_token}} = Tutors.update_token(tutor)
        conn
        |> put_status(:created)
        |> render("show.json", session_token: session_token )
      tutor ->
        conn
        |> put_status(:unauthorized)
        |> render("error.json", tutor_params)
      true ->
        dummy_checkpw()
        conn
        |> put_status(:unauthorized)
        |> render("error.json", tutor_params)
    end
  end

end
