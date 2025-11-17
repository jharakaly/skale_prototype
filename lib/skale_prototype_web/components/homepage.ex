defmodule SkalePrototypeWeb.Components.Homepage do
  use SkalePrototypeWeb, :components
  alias SkalePrototypeWeb.Components.ActivityFeed

  def render(assigns) do
    assigns = assign_new(assigns, :active_tab, fn -> "groups" end)

    ~H"""
    <div class="w-full bg-white min-h-screen">
      <!-- Full-width wrapper to match header -->
      <div class="max-w-6xl mx-auto px-4">
        <!-- Search bar -->
        <div class="py-6">
          <div class="left-search-container">
            <span class="search-icon">Search</span>
            <input type="text" placeholder="Ask a question, share an idea..." class="p-2 rounded text-base search-input w-full">
          </div>
        </div>

        <!-- Main content area -->
        <div class="flex flex-col lg:flex-row gap-8 pb-12">
          <!-- Left Column -->
          <div class="flex-1 lg:w-0">
            <div class="button-group mb-6">
              <button
                phx-click="show-tab"
                phx-value-tab="groups"
                class={"nav-button #{if @active_tab == "groups", do: "bg-[#A3B18A] text-white", else: "bg-gray-200 text-gray-700"}"}>
                Groups
              </button>
              <button
                phx-click="show-tab"
                phx-value-tab="activity"
                class={"nav-button #{if @active_tab == "activity", do: "bg-[#A3B18A] text-white", else: "bg-gray-200 text-gray-700"}"}>
                Activity
              </button>
            </div>

            <div class="space-y-6">
              <%= if @active_tab == "groups" do %>
                <!-- Vegan Cookbook Club Card -->
                <div class="group-card">
                  <div class="group-header">
                    <div class="group-info">
                      <h2 class="text-black text-base font-semibold">Vegan Cookbook Club</h2>
                      <p class="text-black text-sm">700 members · 5 new topics · 44 replies</p>
                    </div>
                    <div class="group-avatar"></div>
                  </div>
                  <div class="post-container">
                    <div class="post">
                      <div class="post-avatar">C</div>
                      <div class="post-content">
                        <div class="post-meta">
                          <span class="post-author">cabot</span>
                          <span class="post-time">5m</span>
                        </div>
                        <p class="text-black text-sm">We successfully made our first baked vegan mac and cheese from the cookbook and it was absolutely delicious! The cashew-based sauce was surprisingly creamy.</p>
                      </div>
                    </div>
                  </div>
                </div>

                <!-- South Shore Eats Card -->
                <div class="group-card">
                  <div class="group-header">
                    <div class="group-info">
                      <h2 class="text-black text-base font-semibold">South Shore Eats</h2>
                      <p class="text-black text-sm">1k members · 7 new topics · 56 replies</p>
                    </div>
                    <div class="group-avatar"></div>
                  </div>
                  <div class="post-container">
                    <div class="post">
                      <div class="post-avatar">C</div>
                      <div class="post-content">
                        <div class="post-meta">
                          <span class="post-author">Christina</span>
                          <span class="post-time">1hr</span>
                        </div>
                        <p class="text-black text-sm">The farmers market in Cohasset will feature a new raw bar on Saturday with fresh oysters from local farms. They're also hosting a cooking demonstration!</p>
                      </div>
                    </div>
                  </div>
                </div>
              <% else %>
                <ActivityFeed.render />
              <% end %>
            </div>
          </div>

          <!-- Right Sidebar -->
          <div class="lg:w-80 xl:w-96">
            <SkalePrototypeWeb.Components.RightSidebar.right_sidebar />
          </div>
        </div>
      </div>
    </div>

    <style>
      .left-search-container { position: relative; }
      .search-icon {
        position: absolute; left: 1rem; top: 50%; transform: translateY(-50%);
        font-size: 1.2rem; color: #6b7280;
      }
      .search-input {
        padding-left: 3rem; width: 100%; background: white;
        border: 1px solid #e5e7eb; border-radius: 8px;
        box-shadow: 0 1px 2px rgba(0,0,0,0.05); font-size: 1rem;
      }
      .button-group { display: flex; gap: 0.5rem; }
      .nav-button {
        padding: 0.5rem 1rem; border-radius: 6px; font-size: 0.9rem;
      }
      .group-card {
        background: white; border: 1px solid #e5e7eb; border-radius: 12px;
        padding: 1.5rem; box-shadow: 0 2px 4px rgba(0,0,0,0.05);
      }
      .group-header { display: flex; align-items: flex-start; gap: 1rem; margin-bottom: 1rem; }
      .group-avatar { width: 4rem; height: 4rem; background-color: #9ca3af; border-radius: 8px; flex-shrink: 0; order: 2; }
      .group-info { flex-grow: 1; order: 1; }
      .post-container { border-top: 1px solid #d1d5db; padding-top: 1rem; }
      .post { display: flex; align-items: flex-start; gap: 0.75rem; }
      .post-avatar {
        width: 2.5rem; height: 2.5rem; background-color: #a3b18a;
        border-radius: 50%; flex-shrink: 0; display: flex;
        align-items: center; justify-content: center; color: white;
        font-weight: bold; font-size: 0.9rem;
      }
      .post-content { flex-grow: 1; }
      .post-meta { display: flex; align-items: center; margin-bottom: 0.25rem; }
      .post-author { font-weight: 600; margin-right: 0.5rem; font-size: 0.9rem; }
      .post-time { color: #6b7280; font-size: 0.8rem; }
    </style>
    """
  end
end
