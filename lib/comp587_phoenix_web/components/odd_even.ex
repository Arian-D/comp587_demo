defmodule Comp587PhoenixWeb.OddEvenComponent do
  use Phoenix.Component
	
  attr :number, :string, required: true
  def odd_component(assigns) do
    ~H"""
    <p>{@number} is an odd number.</p>
    """
  end

  attr :number, :string, required: true
  def even_component(assigns) do
    ~H"""
    <p>{@number} is an even number.</p>
    """
  end

  attr :number, :string, required: true
  def invalid_component(assigns) do
    ~H"""
    <p>{@number} is not a number</p>
    """
  end
end
