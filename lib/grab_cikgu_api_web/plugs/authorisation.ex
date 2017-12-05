defmodule GrabCikguApiWeb.Plugs.Authorisation do
  import Plug.Conn
  alias GrabCikguApi.Tutors

  def init(default), do: default

  def call(%Plug.Conn{} = conn, _default) do
    encoded_json_error =
      Poison.encode!(%{errors: %{details: "You need to be logged in to do that"}})

    case get_req_header(conn, "authorization") do
      [] ->
        conn
        |> send_resp(401, encoded_json_error)
        |> halt
      [token] ->
        case Tutors.get_tutor_by_token(%{token: token}) do
          nil ->
            conn
            |> send_resp(401, encoded_json_error)
            |> halt
          user ->
            conn
            |> assign(:current_user, user)
        end
    end
  end
end
