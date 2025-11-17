defmodule SkalePrototypeWeb.HomeLive do
  use SkalePrototypeWeb, :live_view
  alias SkalePrototypeWeb.Components.Homepage

  # --- sets default tab to "groups" ---
  def mount(_params, _session, socket) do
    {:ok, assign(socket, active_tab: "groups")}
  end

  # --- handles the tab switching event ---
  def handle_event("show-tab", %{"tab" => tab}, socket) do
    {:noreply, assign(socket, :active_tab, tab)}
  end

  # --- renders the homepage component ---
  def render(assigns) do
    ~H"""
    <Homepage.render active_tab={@active_tab} />
    """
  end
end
