defmodule Comp587PhoenixWeb.PageController do
  use Comp587PhoenixWeb, :controller

  def home(conn, %{"value" => value}) do
    # The home page is often custom made,
    # so skip the default app layout.
    render(conn, :home, layout: false)
  end
  def home(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    render(conn, :home, layout: false)
  end
end
