defmodule SkalePrototypeWeb.ActivityLive do
  use SkalePrototypeWeb, :live_view
  alias SkalePrototypeWeb.Components.ActivityFeed
  #alias SkalePrototypeWeb.Components.RightSidebar

  def mount(_params, _session, socket) do
    {:ok, assign(socket, :page_title, "Activity")}
  end

  def render(assigns) do
    ~H"""
    <div class="container mx-auto px-4 mt-6">

      <div class="main-content">
        <div class="left-column w-full md:w-2/3">
          <ActivityFeed.render />
        </div>

        <div class="right-column hidden md:block w-1/3 pl-4">
          <SkalePrototypeWeb.Components.RightSidebar.right_sidebar />
        </div>
      </div>

    </div>
    """
  end
end
