defmodule AdoptingPoolboyWeb.PageController do
  use AdoptingPoolboyWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
