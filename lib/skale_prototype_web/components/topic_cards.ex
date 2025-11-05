defmodule SkalePrototypeWeb.Components.TopicCard do
  use SkalePrototypeWeb, :html

  attr :id, :integer, required: true
  attr :title, :string, required: true
  attr :excerpt, :string, required: true
  attr :reply_count, :integer, required: true
  attr :time_ago, :string, required: true
  attr :avatars, :list, required: true
  attr :additional_count, :integer, required: true

  def topic_card(assigns) do
    ~H"""
    <div class="topic-card bg-white rounded-lg shadow-sm border border-gray-200 p-6 mb-4">
      <div class="topic-header mb-4">
        <div class="topic-content">
          <h3 class="topic-title text-lg font-semibold text-gray-900 mb-2"><%= @title %></h3>
          <p class="topic-excerpt text-gray-600"><%= @excerpt %></p>
        </div>
        <div class="topic-meta flex justify-between items-center mt-3 text-sm text-gray-500">
          <span><%= @reply_count %> replies</span>
          <span><%= @time_ago %></span>
        </div>
      </div>

      <div class="topic-footer flex justify-between items-center">
        <div class="topic-avatars flex items-center">
          <div class="flex -space-x-2">
            <%= for {avatar, index} <- Enum.with_index(Enum.take(@avatars, 3)) do %>
              <div class="w-6 h-6 bg-blue-500 rounded-full flex items-center justify-center text-xs text-white font-medium border-2 border-white">
                <%= avatar %>
              </div>
            <% end %>
            <%= if @additional_count && @additional_count > 0 do %>
              <div class="w-6 h-6 bg-gray-300 rounded-full flex items-center justify-center text-xs text-gray-600 font-medium border-2 border-white">
                +<%= @additional_count %>
              </div>
            <% end %>
          </div>
        </div>

        <!-- Action Buttons - ALL THREE BUTTONS -->
        <div class="topic-actions flex items-center gap-4">
          <!-- Heart Icon -->
          <button class="flex items-center gap-1 text-gray-500 hover:text-red-500 transition-colors">
            <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4.318 6.318a4.5 4.5 0 000 6.364L12 20.364l7.682-7.682a4.5 4.5 0 00-6.364-6.364L12 7.636l-1.318-1.318a4.5 4.5 0 00-6.364 0z" />
            </svg>
            <span class="text-xs">Like</span>
          </button>

          <!-- Comment Bubble Icon -->
          <button class="flex items-center gap-1 text-gray-500 hover:text-blue-500 transition-colors">
            <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 12h.01M12 12h.01M16 12h.01M21 12c0 4.418-4.03 8-9 8a9.863 9.863 0 01-4.255-.949L3 20l1.395-3.72C3.512 15.042 3 13.574 3 12c0-4.418 4.03-8 9-8s9 3.582 9 8z" />
            </svg>
            <span class="text-xs"><%= @reply_count %></span>
          </button>

          <!-- VIEW COMMENTS BUTTON - KEEP THIS FUCKING BUTTON -->
          <button
            class="view-replies-btn bg-blue-500 hover:bg-blue-600 text-white px-4 py-2 rounded-lg text-sm font-medium transition-colors"
            phx-click="toggle_replies"
            phx-value-topic-id={@id}
          >
            View replies
          </button>
        </div>
      </div>
    </div>
    """
  end
end
