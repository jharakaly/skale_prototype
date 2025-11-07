defmodule SkalePrototypeWeb.ActivityLive do
  use SkalePrototypeWeb, :live_view
  use SkalePrototypeWeb, :components

  alias SkalePrototypeWeb.Components.TopicCards
  alias SkalePrototypeWeb.Components.RightSidebar

  def mount(_params, _session, socket) do
    groups = [
      %{name: "Vegan Cookbook Club", subgroups: ["Beginner Vegan", "Vegan Baking", "Meal Prep"]},
      %{name: "South Shore Eats", subgroups: ["Local Restaurants", "Farmers Markets", "Food Events"]}
    ]

    {:ok,
     assign(socket,
       activities: SkalePrototypeWeb.MockData.get_all_topics(),
       groups: groups,
       selected_group: nil,
       selected_subgroup: nil,
       show_modal: false,
       show_confirm: false,
       title: "",
       content: "",
       subgroups: []
     )}
  end

  def handle_event("toggle-modal", _, socket) do
    {:noreply, assign(socket, show_modal: !socket.assigns.show_modal, show_confirm: false)}
  end

  def handle_event("confirm-cancel", _, socket) do
    {:noreply, assign(socket, show_confirm: true)}
  end

  def handle_event("cancel-confirmed", _, socket) do
    {:noreply,
     assign(socket,
       show_modal: false,
       show_confirm: false,
       title: "",
       content: "",
       selected_group: nil,
       selected_subgroup: nil,
       subgroups: []
     )}
  end

  def handle_event("cancel-no", _, socket) do
    {:noreply, assign(socket, show_confirm: false)}
  end

  def handle_event("select-group", %{"group" => group}, socket) do
    subgroups =
      Enum.find(socket.assigns.groups, &(&1.name == group)).subgroups

    {:noreply,
     assign(socket,
       selected_group: group,
       subgroups: subgroups,
       selected_subgroup: nil
     )}
  end

  def handle_event("select-subgroup", %{"subgroup" => subgroup}, socket) do
    {:noreply, assign(socket, selected_subgroup: subgroup)}
  end

  def handle_event("update-title", %{"value" => title}, socket) do
    {:noreply, assign(socket, title: title)}
  end

  def handle_event("update-content", %{"value" => content}, socket) do
    {:noreply, assign(socket, content: content)}
  end

  def handle_event("submit-post", _, socket) do
    IO.inspect(%{
      group: socket.assigns.selected_group,
      subgroup: socket.assigns.selected_subgroup,
      title: socket.assigns.title,
      content: socket.assigns.content
    })

    {:noreply,
     assign(socket,
       show_modal: false,
       title: "",
       content: "",
       selected_group: nil,
       selected_subgroup: nil,
       subgroups: []
     )}
  end

  def render(assigns) do
    ~H"""
    <div class="container mx-auto px-4">
      <!-- Ask a question bar — triggers modal -->
      <div class="search-row">
        <div
          class="left-search-container"
          phx-click="toggle-modal"
          style="cursor: pointer;"
        >
          <span class="search-icon">Search</span>
          <input
            type="text"
            placeholder="Ca"
            class="p-2 rounded text-base search-input"
            readonly
          >
        </div>
      </div>

      <!-- New Post Modal -->
      <%= if @show_modal do %>
        <div class="fixed inset-0 bg-gray-500 bg-opacity-50 flex items-center justify-center z-50">
          <form phx-submit="submit-post" class="bg-white p-6 rounded-lg shadow-lg w-full max-w-md">
            <h3 class="text-lg font-semibold mb-4">Create a New Post</h3>

            <!-- Group Dropdown -->
            <select name="group" phx-change="select-group" class="w-full p-2 border border-gray-300 rounded mb-4">
              <option value="">Select Group</option>
              <%= for group <- @groups do %>
                <option value={group.name} selected={group.name == @selected_group}>
                  <%= group.name %>
                </option>
              <% end %>
            </select>

            <!-- Subgroup Dropdown -->
            <select
              name="subgroup"
              phx-change="select-subgroup"
              class="w-full p-2 border border-gray-300 rounded mb-4"
              disabled={!@selected_group}
            >
              <option value="">Select Subgroup</option>
              <%= for subgroup <- @subgroups do %>
                <option value={subgroup} selected={subgroup == @selected_subgroup}>
                  <%= subgroup %>
                </option>
              <% end %>
            </select>

            <!-- Title -->
            <input
              type="text"
              name="title"
              placeholder="Title of your post"
              class="w-full p-2 border border-gray-300 rounded mb-4"
              phx-change="update-title"
              value={@title}
            />

            <!-- Content -->
            <textarea
              name="content"
              rows="4"
              placeholder="Write your post here..."
              class="w-full p-2 border border-gray-300 rounded mb-2"
              phx-change="update-content"
            ><%= @content %></textarea>

            <!-- Icons BELOW textarea -->
            <div class="flex space-x-2 text-sm text-gray-600 mb-4">
              <button type="button" class="hover:text-gray-800 font-bold">B</button>
              <button type="button" class="hover:text-gray-800 italic">
                <img src="https://cdn-icons-png.flaticon.com/512/3856/3856080.png" alt="Italic" class="w-4 h-4" />
              </button>
              <button type="button" class="hover:text-gray-800">
                <img src="https://cdn-icons-png.flaticon.com/512/158/158420.png" alt="Emoji" class="w-4 h-4" />
              </button>
              <button type="button" class="hover:text-gray-800">
                <img src="https://cdn-icons-png.flaticon.com/512/8637/8637814.png" alt="Link" class="w-4 h-4" />
              </button>
            </div>

            <div class="flex justify-end gap-2">
              <button
                type="button"
                class="px-4 py-2 bg-gray-300 text-black rounded hover:bg-gray-400"
                phx-click="confirm-cancel"
              >
                Cancel
              </button>
              <button
                type="submit"
                class="px-4 py-2 bg-[#A3B18A] text-white rounded hover:bg-[#8fb382]"
              >
                Post
              </button>
            </div>
          </form>
        </div>
      <% end %>

      <!-- Cancel Confirmation -->
      <%= if @show_confirm do %>
        <div class="fixed inset-0 bg-gray-500 bg-opacity-50 flex items-center justify-center z-50">
          <div
            class="bg-white p-6 rounded-lg shadow-lg w-full max-w-sm"
            phx-click-away="cancel-no"
            phx-window-keydown="cancel-no"
            phx-key="Escape"
          >
            <p class="text-lg mb-4">Are you sure you want to cancel? You will lose your progress.</p>
            <div class="flex justify-end gap-2">
              <button
                type="button"
                class="px-4 py-2 bg-gray-300 text-black rounded hover:bg-gray-400"
                phx-click="cancel-no"
              >
                No, continue
              </button>
              <button
                type="button"
                class="px-4 py-2 bg-[#A3B18A] text-white rounded hover:bg-[#8fb382]"
                phx-click="cancel-confirmed"
              >
                Yes, cancel
              </button>
            </div>
          </div>
        </div>
      <% end %>

      <!-- Main Content -->
      <div class="main-content">
        <div class="left-column">
          <div class="button-group">
            <a href="/" class="nav-button bg-gray-200 text-gray-700">Groups</a>
            <button class="nav-button bg-[#A3B18A] text-white">Activity</button>
          </div>

          <div class="topics-container mt-6">
            <%= for activity <- @activities do %>
              <TopicCards.topic_cards
                id={activity.id}
                title={activity.title}
                excerpt={activity.excerpt}
                content={activity.content}
                reply_count={activity.reply_count}
                time_ago={activity.time_ago}
                avatars={activity.avatars}
                additional_count={activity.additional_count}
                has_media={Map.get(activity, :media, nil) != nil && Map.get(activity, :media, []) != []}
                media_type={
                  if Map.get(activity, :media, nil) != nil && Map.get(activity, :media, []) != [] do
                    activity.media |> List.first() |> Map.get(:type)
                  end
                }
                media={Map.get(activity, :media, [])}
              />
            <% end %>
          </div>
        </div>

        <RightSidebar.right_sidebar />
      </div>
    </div>

    <style>
      .container { width: 100%; max-width: 1200px; margin: 0 auto; padding: 0 1rem; }
      .search-row { display: flex; flex-direction: column; gap: 1rem; padding: 1rem 0; width: 100%; }
      @media (min-width: 768px) { .search-row { flex-direction: row; } }
      .left-search-container { width: 100%; position: relative; }
      @media (min-width: 768px) {
        .left-search-container { flex: 0 0 100%; }
      }
      .search-icon { position: absolute; left: 1rem; top: 50%; transform: translateY(-50%); font-size: 1.2rem; color: #6b7280; }
      .search-input {
        padding-left: 3rem;
        width: 100%;
        background-color: white;
        border: 1px solid #e5e7eb;
        border-radius: 8px;
        box-shadow: 0 1px 2px rgba(0, 0, 0, 0.05);
        font-size: 1rem;
      }
      @media (min-width: 768px) {
        .left-search-container {
          max-width: 70%;
          margin: 0 auto;
        }
      }
      @media (max-width: 480px) { .search-input { font-size: 16px; } }

      .main-content { display: flex; flex-direction: column; width: 100%; padding: 0; }
      @media (min-width: 768px) { .main-content { flex-direction: row; } }
      .left-column { width: 100%; padding-right: 0; }
      @media (min-width: 768px) { .left-column { flex: 0 0 70%; padding-right: 1rem; } }
      .right-column { width: 100%; padding-left: 0; margin-top: 2rem; }
      @media (min-width: 768px) { .right-column { flex: 0 0 30%; padding-left: 1rem; margin-top: 0; } }

      .button-group { display: flex; gap: 0.5rem; margin-bottom: 1rem; }
      .nav-button { padding: 0.5rem 1rem; border-radius: 6px; font-size: 0.9rem; text-decoration: none; display: inline-block; text-align: center; }

      .collection-container {
        aspect-ratio: 1 / 1;
        display: flex;
        flex-direction: column;
        background-color: white;
        border: 1px solid #e5e7eb;
        border-radius: 12px;
        padding: 1.5rem;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.05);
        margin-bottom: 1.5rem;
      }
      @media (max-width: 480px) {
        .collection-container {
          padding: 1rem;
          margin-bottom: 1rem;
        }
      }
      .collection-header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 0.5rem;
      }
      .gray-square {
        width: 100%;
        flex-grow: 1;
        background-color: #9ca3af;
        border-radius: 8px;
      }
    </style>
    """
  end
end
