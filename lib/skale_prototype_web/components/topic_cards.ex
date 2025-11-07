defmodule SkalePrototypeWeb.Components.TopicCards do
  use SkalePrototypeWeb, :components

  attr :id, :integer, required: true
  attr :title, :string, required: true
  attr :excerpt, :string, required: true
  attr :content, :string, required: true
  attr :reply_count, :integer, required: true
  attr :time_ago, :string, required: true
  attr :avatars, :list, default: []
  attr :additional_count, :integer, default: 0
  attr :has_media, :boolean, default: false
  attr :media_type, :string, default: nil
  attr :media, :list, default: []

  def topic_cards(assigns) do
    ~H"""
    <div id={"topic-#{@id}"} class="topic-card">
      <div class="flex justify-between items-start gap-4">
        <!-- Main content area - full width when expanded -->
        <div id={"left-col-#{@id}"} class="flex-1 min-w-0" style="width: 80%;">
          <div class="topic-header mb-2">
            <div class="topic-content cursor-pointer" onclick={"toggleReadMore(#{@id})"}>
              <h3 class="topic-title font-semibold text-gray-900 text-base mb-1"><%= @title %></h3>

              <!-- Content with read more functionality -->
              <div class="content-container relative">
                <div class="topic-text-content">
                  <!-- Show only excerpt when collapsed, show only full content when expanded -->
                  <div id={"excerpt-#{@id}"} class="text-gray-700 text-sm break-words line-clamp-3">
                    <%= @excerpt %>
                  </div>
                  <div id={"content-full-#{@id}"} class="hidden">
                    <!-- Full content moves up to where excerpt was - full width -->
                    <div class="text-gray-700 text-sm break-words whitespace-pre-line bg-white">
                      <%= @content %>
                    </div>

                    <!-- Media display in expanded view - centered and reduced size -->
                    <%= if @media != [] do %>
                      <div class="flex justify-center my-3">
                        <%= for media_item <- @media do %>
                          <%= case media_item.type do %>
                            <% "image" -> %>
                              <img
                                src={media_item.url}
                                alt="Post image"
                                class="max-w-full h-auto rounded-lg max-h-48 object-contain"
                              />
                            <% "video" -> %>
                              <div class="w-full max-w-lg">
                                <iframe
                                  src={media_item.url}
                                  class="w-full h-48 rounded-lg"
                                  title="Video content"
                                  frameborder="0"
                                  allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                                  allowfullscreen>
                                </iframe>
                              </div>
                          <% end %>
                        <% end %>
                      </div>
                    <% end %>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>

        <!-- Right column - 20% width with time and thumbnail -->
        <div id={"right-col-#{@id}"} class="flex flex-col items-end space-y-2 flex-shrink-0" style="width: 20%;">
          <!-- Time counter at top -->
          <div class="text-xs text-gray-500 whitespace-nowrap w-full text-right">
            <%= @time_ago %>
          </div>

          <!-- Thumbnail - takes full width of right column (hidden when expanded) -->
          <%= if @has_media do %>
            <div id={"thumbnail-#{@id}"} class="w-full rounded overflow-hidden border border-gray-200 flex-shrink-0">
              <%= for media_item <- Enum.take(@media, 1) do %>
                <%= case media_item.type do %>
                  <% "image" -> %>
                    <img
                      src={media_item.url}
                      alt="Thumbnail"
                      class="w-full h-20 object-cover"
                    />
                  <% "video" -> %>
                    <div class="w-full h-20 bg-gray-100 flex items-center justify-center">
                      <svg class="w-6 h-6 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M14.752 11.168l-3.197-2.132A1 1 0 0010 9.87v4.263a1 1 0 001.555.832l3.197-2.132a1 1 0 000-1.664z" />
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
                      </svg>
                    </div>
                <% end %>
              <% end %>
            </div>
          <% end %>
        </div>
      </div>

      <!-- Footer locked to bottom with stats and buttons side-by-side -->
      <div class="topic-footer flex justify-between items-center mt-3 pt-2 border-t border-gray-100">
        <!-- Left side: Stats and avatars -->
        <div class="topic-stats flex items-center space-x-2">
          <span class="text-xs text-gray-600"><%= @reply_count %> replies</span>
          <%= if @avatars != [] do %>
            <div class="topic-avatars flex -space-x-1">
              <%= for {avatar, index} <- Enum.with_index(@avatars, 1) do %>
                <div class={"w-4 h-4 rounded-full flex items-center justify-center text-xs text-white font-medium border border-white #{avatar_green_class(index)}"}>
                  <%= avatar %>
                </div>
              <% end %>
              <%= if @additional_count > 0 do %>
                <div class="w-4 h-4 bg-gray-300 rounded-full flex items-center justify-center text-xs text-gray-600 font-medium border border-white">
                  +<%= @additional_count %>
                </div>
              <% end %>
            </div>
          <% end %>
        </div>

        <!-- Right side: Buttons side-by-side -->
        <div class="topic-actions flex items-center space-x-2">
          <!-- Read More Button -->
          <button
            class="read-more-btn flex items-center space-x-1 text-[#76a368] hover:text-[#5e8a52] transition-colors text-xs"
            onclick={"toggleReadMore(#{@id})"}
            id={"read-more-btn-#{@id}"}
          >
            <svg class="w-3 h-3 transition-transform duration-200" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7" />
            </svg>
            <span>Read more</span>
          </button>

          <!-- View Replies Button -->
          <button
            class="view-replies-btn bg-[#76a368] hover:bg-[#5e8a52] text-white rounded px-3 py-1 text-xs font-medium transition-colors"
            phx-value-topic-id={@id}
          >
            View replies
          </button>
        </div>
      </div>
    </div>
    """
  end

  defp avatar_green_class(1), do: "bg-[#8fb382]"
  defp avatar_green_class(2), do: "bg-[#76a368]"
  defp avatar_green_class(3), do: "bg-[#6b9975]"
  defp avatar_green_class(_), do: "bg-[#8fb382]"
end
