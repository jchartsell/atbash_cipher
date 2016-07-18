defmodule AtbashCipher.PageControllerTest do
  use AtbashCipher.ConnCase

  test "GET /", %{conn: conn} do
    conn = get conn, "/"
    assert html_response(conn, 200) =~ "Atbash Cipher"
  end
end
