defmodule Comp587PhoenixWeb.OddEvenController do
  require Integer
  use Comp587PhoenixWeb, :controller

  def even?(conn, %{"value" => value}) do
    case Integer.parse(value) do
    	{number, ""} when Integer.is_even(number) ->
    	  conn |> text("#{number} is even.")
    	{number, ""} when Integer.is_odd(number) ->
    	  conn |> text("#{number} is odd.")
      {_, _} ->
        conn
  	    |> put_status(:bad_request)    		
        |> text("#{value} is not an integer.")
  	  :error ->
  	    conn
  	    |> put_status(:bad_request)    		
  	    |> text("#{value} is not a number ❗")
    end
  end
end
