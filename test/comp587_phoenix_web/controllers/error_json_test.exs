defmodule Comp587PhoenixWeb.ErrorJSONTest do
  use Comp587PhoenixWeb.ConnCase, async: true

  test "renders 404" do
    assert Comp587PhoenixWeb.ErrorJSON.render("404.json", %{}) == %{errors: %{detail: "Not Found"}}
  end

  test "renders 500" do
    assert Comp587PhoenixWeb.ErrorJSON.render("500.json", %{}) ==
             %{errors: %{detail: "Internal Server Error"}}
  end
end
