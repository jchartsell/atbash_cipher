defmodule AtbashCipher.PageController do
  use AtbashCipher.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
