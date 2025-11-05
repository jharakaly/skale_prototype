defmodule SkalePrototypeWeb.Components.TopicDetail do
  use SkalePrototypeWeb, :html

  attr :topic, :map, required: true

  def topic_detail(assigns) do
    ~H"""
    <div class="bg-white p-4 md:p-6 rounded-lg w-full">
      <div class="flex items-start justify-between mb-4">
        <h2 class="text-lg md:text-xl font-semibold text-gray-900 break-words pr-2"><%= @topic.title %></h2>
        <span class="text-sm text-gray-500 bg-gray-100 px-2 py-1 rounded flex-shrink-0">
          <%= @topic.time_ago %>
        </span>
      </div>

      <p class="text-gray-700 mb-4 md:mb-6 text-sm md:text-base break-words"><%= @topic.excerpt %></p>

      <div class="flex items-center justify-between text-sm text-gray-500 mb-4">
        <div class="flex items-center space-x-1">
          <span><%= @topic.reply_count %> replies</span>
        </div>
        <div class="flex items-center space-x-1">
          <%= if @topic.avatars do %>
            <div class="flex -space-x-2">
              <%= for avatar <- Enum.take(@topic.avatars, 3) do %>
                <div class="w-5 h-5 md:w-6 md:h-6 bg-blue-500 rounded-full flex items-center justify-center text-xs text-white font-medium border-2 border-white flex-shrink-0">
                  <%= avatar %>
                </div>
              <% end %>
              <%= if @topic.additional_count && @topic.additional_count > 0 do %>
                <div class="w-5 h-5 md:w-6 md:h-6 bg-gray-300 rounded-full flex items-center justify-center text-xs text-gray-600 font-medium border-2 border-white flex-shrink-0">
                  +<%= @topic.additional_count %>
                </div>
              <% end %>
            </div>
          <% end %>
        </div>
      </div>

      <div class="w-full">
        <% replies = Map.get(@topic, :replies) || [] %>
        <%= if length(replies) > 0 do %>
          <%= for reply <- replies do %>
            <%= if reply do %>
              <.reply reply={reply} depth={0} />
            <% end %>
          <% end %>
        <% else %>
          <p class="text-gray-500 text-center py-6 md:py-7 text-sm md:text-base">
            No replies to display.
            <%= if @topic.reply_count && @topic.reply_count > 0 do %>
              (This topic has <%= @topic.reply_count %> replies but they're not loaded)
            <% end %>
          </p>
        <% end %>
      </div>
    </div>
    """
  end

  def reply(assigns) do
    assigns =
      assigns
      |> assign(:reply_id, assigns.reply[:id] || "")
      |> assign(:author, assigns.reply[:author] || "Anonymous")
      |> assign(:time_ago, assigns.reply[:time_ago] || "recently")
      |> assign(:content, assigns.reply[:content] || "")
      |> assign(:likes, assigns.reply[:likes] || 0)
      |> assign(:nested_replies, Map.get(assigns.reply || %{}, :replies, []))
      |> assign(:has_nested, length(Map.get(assigns.reply || %{}, :replies, [])) > 0)

    ~H"""
    <div class="reply py-2.5 md:py-3 w-full" id={"reply-#{@reply_id}"}>
      <div class="flex items-start w-full">
        <div class="w-6 h-6 md:w-7 md:h-7 bg-blue-500 rounded-full flex items-center justify-center text-xs md:text-sm text-white font-medium flex-shrink-0">
          <%= String.at(@author, 0) %>
        </div>

        <div class="flex-1 min-w-0 pl-1.5 md:pl-2 flex flex-col">
          <div class="flex flex-col sm:flex-row sm:items-center sm:space-x-2 mb-0.5">
            <span class="font-medium text-gray-900 text-sm md:text-base break-words"><%= @author %></span>
            <span class="text-gray-500 text-xs md:text-sm mt-0.5 sm:mt-0"><%= @time_ago %></span>
          </div>
          <p class="text-gray-700 text-sm md:text-base break-words pb-3"><%= @content %></p>

          <!-- Show More / Hide in Center -->
          <div class="flex justify-center mt-1">
            <%= if @has_nested do %>
              <button
                onclick={"toggleReplies('#{@reply_id}')"}
                class="expand-btn flex items-center space-x-1 text-gray-500 hover:text-blue-500 transition-colors cursor-pointer"
                data-reply-id={@reply_id}
                data-count={length(@nested_replies)}
              >
                <svg class="w-3 h-3 md:w-3.5 md:h-3.5 transition-transform duration-200" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7" />
                </svg>
                <span class="hidden sm:inline show-text">Show <%= length(@nested_replies) %></span>
                <span class="sm:hidden"><%= length(@nested_replies) %></span>
              </button>
            <% end %>
          </div>

          <!-- Heart + Reply on Far Right -->
          <div class="flex justify-end items-center space-x-4 text-xs md:text-sm mt-1">
            <button class="flex items-center space-x-1 text-gray-500 hover:text-red-500 transition-colors">
              <svg class="w-3 h-3 md:w-3.5 md:h-3.5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4.318 6.318a4.5 4.5 0 000 6.364L12 20.364l7.682-7.682a4.5 4.5 0 00-6.364-6.364L12 7.636l-1.318-1.318a4.5 4.5 0 00-6.364 0z" />
              </svg>
              <span class="hidden xs:inline"><%= @likes %></span>
            </button>

            <button
              onclick={"showReplyForm('#{@reply_id}')"}
              data-action="reply"
              data-reply-id={@reply_id}
              class="flex items-center space-x-1 text-gray-500 hover:text-blue-500 transition-colors cursor-pointer"
            >
              <svg class="w-3 h-3 md:w-3.5 md:h-3.5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 10h10a8 8 0 018 8v2M3 10l6 6m-6-6l6-6" />
              </svg>
              <span class="hidden sm:inline">Reply</span>
            </button>
          </div>
        </div>
      </div>

      <!-- Reply Form (inline) -->
      <div id={"reply-form-#{@reply_id}"} class="hidden mt-2 pl-8">
        <div class="p-3 bg-white border border-gray-200 rounded-lg">
          <textarea
            rows="3"
            class="w-full p-2 border border-gray-300 rounded text-sm focus:outline-none focus:ring-2 focus:ring-blue-500"
            placeholder="Write your reply..."
          ></textarea>

          <!-- Icons at bottom -->
          <div class="flex items-center justify-between mt-2">
            <div class="flex space-x-2 text-sm text-gray-600">
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
            <div class="flex items-center space-x-2">
              <button
                type="button"
                onclick={"cancelReply('#{@reply_id}')"}
                class="text-gray-500 hover:text-gray-700"
              >
                <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12" />
                </svg>
              </button>
              <button
                type="button"
                onclick={"submitReply('#{@reply_id}')"}
                class="px-4 py-1 bg-blue-600 text-white text-sm rounded hover:bg-blue-700"
              >
                Reply
              </button>
            </div>
          </div>
        </div>
      </div>

      <!-- Nested Replies -->
      <%= if @has_nested do %>
        <div id={"nested-replies-#{@reply_id}"} class="hidden w-full mt-1">
          <div class="pl-6 space-y-2.5 md:space-y-3 w-full">
            <%= for nested_reply <- @nested_replies do %>
              <%= if nested_reply do %>
                <.reply reply={nested_reply} depth={@depth + 1} />
              <% end %>
            <% end %>
          </div>
        </div>
      <% end %>
    </div>
    """
  end
end
