defmodule SkalePrototypeWeb.GroupsLive do
  use SkalePrototypeWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <.live_component module={SkalePrototypeWeb.Components.Groups} id="groups" />
    """
  end
end
