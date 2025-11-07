defmodule SkalePrototypeWeb.HomeLive do
  use SkalePrototypeWeb, :live_view
  use SkalePrototypeWeb, :components

  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <SkalePrototypeWeb.Components.Homepage.render />
    """
  end
end
