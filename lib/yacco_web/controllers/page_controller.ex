defmodule YaccoWeb.PageController do
  use YaccoWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
