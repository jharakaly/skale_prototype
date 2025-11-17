defmodule SkalePrototypeWeb.Components.ActivityFeed do
  use SkalePrototypeWeb, :components
  alias SkalePrototypeWeb.MockData

  def activity_feed(assigns) do
    render(assigns)
  end

  def render(assigns) do
    feed =
      # (MockData.get_notifications() |> Enum.map(&convert_notification_to_item/1)) ++
      (MockData.get_recent_activities() |> Enum.map(&convert_activity_to_item/1))
      |> Enum.reject(&is_nil/1)
      |> Enum.sort_by(& &1.timestamp, {:desc, NaiveDateTime})

    assigns = assign(assigns, :feed, feed)

    ~H"""
    <!-- Alpine.js wrapper for modal functionality -->
    <div x-data="{ showModal: false, modalTopicId: null }">

      <!-- Modal Overlay & Content -->
      <div
        x-show="showModal"
        x-cloak
        class="fixed inset-0 z-50 overflow-y-auto"
        @keydown.escape.window="showModal = false; document.body.style.overflow = 'auto'"
      >
        <!-- Backdrop -->
        <div
          @click="showModal = false; document.body.style.overflow = 'auto'"
          class="fixed inset-0 bg-black bg-opacity-50 transition-opacity"
        ></div>

        <!-- Modal Panel -->
        <div class="flex min-h-full items-start justify-center p-4 pt-20">
          <div
            @click.stop
            class="relative bg-white rounded-lg shadow-xl max-w-4xl w-full max-h-[85vh] overflow-y-auto"
          >
            <!-- Close Button -->
            <button
              @click="showModal = false; document.body.style.overflow = 'auto'"
              class="sticky top-4 right-4 float-right z-10 bg-white rounded-full p-2 shadow-lg hover:bg-gray-100 transition-colors"
            >
              <svg class="w-5 h-5 text-gray-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12" />
              </svg>
            </button>

            <!-- Modal Content: Topic Detail with Replies -->
            <div class="p-8">
              <%= for item <- @feed do %>
                <%= if item.type == :reply && item.reply_context == :topic do %>
                  <div x-show={"modalTopicId === '#{item.topic.id}'"} x-cloak>
                    <!-- Topic Header -->
                    <div class="mb-6">
                      <h2 class="text-2xl font-bold text-gray-900 mb-3"><%= item.topic.title %></h2>
                      <div class="flex items-center gap-2 text-sm text-gray-500 mb-4">
                        <span><%= item.time_ago %></span>
                        <span>•</span>
                        <span class="text-green-600 font-medium"><%= item.group_name || "Community" %></span>
                        <span>•</span>
                        <span><%= item.topic.reply_count %> replies</span>
                      </div>

                      <!-- Topic Media -->
                      <%= if item.topic.media != [] do %>
                        <div class="mb-4">
                          <%= for media <- item.topic.media do %>
                            <%= if media.type == "image" do %>
                              <div class="rounded-lg overflow-hidden">
                                <img src={media.url} alt="Post image" class="w-full h-auto max-h-96 object-contain">
                              </div>
                            <% end %>
                          <% end %>
                        </div>
                      <% end %>

                      <!-- Topic Content -->
                      <div class="prose max-w-none">
                        <p class="text-gray-700 whitespace-pre-line"><%= item.topic.content %></p>
                      </div>
                    </div>

                    <!-- Divider -->
                    <div class="border-t border-gray-200 my-6"></div>

                    <!-- Replies Section -->
                    <div>
                      <h3 class="text-lg font-semibold text-gray-900 mb-4">Replies</h3>

                      <!-- Use the TopicDetail component to render all replies -->
                      <SkalePrototypeWeb.Components.TopicDetail.render topic={MockData.get_topic_replies()} />

                      <!-- Highlight the new reply at the bottom -->
                      <div class="mt-4 border-l-4 border-green-500 bg-green-50 pl-4 py-3 rounded-r">
                        <div class="flex items-start gap-3">
                          <img src={item.user_avatar} class="w-10 h-10 rounded-full border-2 border-green-400" />
                          <div class="flex-1">
                            <div class="flex items-center gap-2 mb-2">
                              <span class="font-semibold text-gray-900"><%= item.user_name %></span>
                              <span class="text-xs bg-green-600 text-white px-2 py-1 rounded-full font-medium">NEW</span>
                              <span class="text-sm text-gray-500 ml-auto"><%= item.time_ago %></span>
                            </div>
                            <p class="text-gray-700"><%= item.reply_text %></p>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                <% end %>
              <% end %>
            </div>
          </div>
        </div>
      </div>
      <!-- Main Activity Feed -->
      <div id="activity-feed" class="topics-container" style="background-color: white;">
        <%= for item <- @feed do %>
          <%= if item && item.type in [:like, :mention, :follow] do %>
            <!-- NOTIFICATION CARDS (LIKE / MENTION / FOLLOW) - NO REPLY BUTTONS -->
            <div class="activity-notification">
              <div class="flex items-start gap-3 p-3 hover:bg-gray-50">
                <img src={item.user_avatar} class="w-8 h-8 rounded-full border border-gray-300 flex-shrink-0" />
                <div class="flex-1 min-w-0">
                  <div class="flex items-start justify-between">
                    <div class="flex-1 min-w-0">
                      <p class="text-sm text-gray-900 font-medium">
                        <%= build_title(item) %>
                      </p>
                      <%= if item.type == :mention and item.mentioned_content do %>
                        <p class="text-sm text-gray-600 mt-1 line-clamp-2"><%= item.mentioned_content %></p>
                      <% end %>
                      <%= if item.type == :like and item.liked_content do %>
                        <p class="text-sm text-gray-600 mt-1 line-clamp-2"><%= item.liked_content %></p>
                      <% end %>
                    </div>
                    <div class="text-xs text-gray-500 whitespace-nowrap ml-2 flex-shrink-0">
                      <%= item.time_ago %>
                    </div>
                  </div>
                  <div class="flex items-center gap-2 mt-2 text-xs text-gray-500">
                    <span class="text-green-600 font-medium"><%= item.group_name || "Community" %></span>
                    <span>•</span>
                    <span><%= build_subtext(item) %></span>
                  </div>
                </div>
              </div>
            </div>

          <% else %>
            <%= if item && item.type == :reply do %>
              <%= if item.reply_context == :topic do %>
                <!-- TYPE 1: DIRECT REPLY TO TOPIC - Show topic card exactly like topic feed -->
                <div class="activity-topic-reply">
                  <!-- TOPIC CARD WITH UPDATED TIMESTAMP AND NO BORDER -->
                  <div id={"topic-#{item.topic.id}"} class="topic-card" style="">
                    <div class="flex justify-between items-start gap-4">
                      <!-- Main content -->
                      <div id={"left-col-#{item.topic.id}"} class="flex-1 min-w-0" style="width: 80%;">
                        <div class="topic-header mb-2">
                          <div class="topic-content cursor-pointer hover:bg-gray-50 rounded p-1 -m-1 transition-colors" onclick={"toggleReadMore('#{item.topic.id}')"}>
                            <h3 class="topic-title font-semibold text-gray-900 text-base mb-1"><%= item.topic.title %></h3>

                            <!-- Collapsed Excerpt -->
                            <div id={"excerpt-#{item.topic.id}"} class="text-gray-700 text-sm break-words line-clamp-3">
                              <%= item.topic.excerpt %>
                            </div>

                            <!-- Expanded Full Content -->
                            <div id={"content-full-#{item.topic.id}"} class="hidden">
                              <%= if item.topic.media != [] do %>
                                <div class="mb-4 flex justify-center">
                                  <div class="max-w-2xl w-full">
                                    <%= for media <- item.topic.media do %>
                                      <%= if media.type == "image" do %>
                                        <div class="rounded-lg overflow-hidden mb-2 flex justify-center">
                                          <img src={media.url} alt="Post image" class="max-w-full h-auto max-h-80 object-contain">
                                        </div>
                                      <% else %>
                                        <%= if media.type == "video" do %>
                                          <div class="rounded-lg overflow-hidden mb-2 flex justify-center">
                                            <iframe src={media.url} class="w-full h-64" frameborder="0" allowfullscreen></iframe>
                                          </div>
                                        <% end %>
                                      <% end %>
                                    <% end %>
                                  </div>
                                </div>
                              <% end %>

                              <p class="text-gray-700 mb-6 text-sm break-words whitespace-pre-line"><%= item.topic.content %></p>
                            </div>
                          </div>
                        </div>
                      </div>

                      <!-- Time & Thumbnail -->
                      <div id={"right-col-#{item.topic.id}"} class="flex flex-col items-end space-y-2 flex-shrink-0" style="width: 20%;">
                        <div class="text-xs text-gray-500 whitespace-nowrap w-full text-right">
                          <%= item.time_ago %>
                        </div>

                        <%= if item.topic.media != [] do %>
                          <div id={"thumbnail-#{item.topic.id}"} class="w-full rounded overflow-hidden border border-gray-200 flex-shrink-0">
                            <%= for media <- Enum.take(item.topic.media, 1) do %>
                              <%= if media.type == "image" do %>
                                <img src={media.url} alt="Thumbnail" class="w-full h-20 object-cover">
                              <% else %>
                                <%= if media.type == "video" do %>
                                  <div class="w-full h-20 bg-gray-100 flex items-center justify-center">
                                    <svg class="w-8 h-8 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M14.752 11.168l-3.197-2.132A1 1 0 0010 9.87v4.263a1 1 0 001.555.832l3.197-2.132a1 1 0 000-1.664z"></path>
                                      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 12a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                                    </svg>
                                  </div>
                                <% end %>
                              <% end %>
                            <% end %>
                          </div>
                        <% end %>
                      </div>
                    </div>

                    <!-- Footer -->
                    <div class="topic-footer flex justify-between items-center mt-3 pt-2">
                      <div class="topic-stats flex items-center space-x-2">
                        <%= if Map.get(item, :new_reply_count, 0) > 0 do %>
                          <div class="flex items-center gap-1 text-xs">
                            <span class="text-green-600 font-semibold"><%= item.new_reply_count %> new</span>
                            <svg class="w-3.5 h-3.5 text-green-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 10h10a8 8 0 018 8v2M3 10l6 6m-6-6l6-6" />
                            </svg>
                          </div>
                          <span class="text-xs text-gray-500">•</span>
                        <% end %>
                        <span class="text-xs text-gray-600"><%= item.topic.reply_count %> total</span>

                        <%= if item.topic.avatars != [] do %>
                          <div class="topic-avatars flex -space-x-1">
                            <%= for avatar <- Enum.take(item.topic.avatars, 3) do %>
                              <div class="w-4 h-4 rounded-full flex items-center justify-center text-xs text-white font-medium border border-white bg-[#8fb382]">
                                <%= avatar %>
                              </div>
                            <% end %>

                            <%= if item.topic.additional_count && item.topic.additional_count > 0 do %>
                              <div class="w-4 h-4 bg-gray-300 rounded-full flex items-center justify-center text-xs text-gray-600 font-medium border border-white">
                                +<%= item.topic.additional_count %>
                              </div>
                            <% end %>
                          </div>
                        <% end %>
                      </div>

                      <!-- Conditional Buttons -->
                      <div class="topic-actions flex items-center space-x-2">
                        <!-- Read More Button -->
                        <button class="read-more-btn flex items-center space-x-1 text-[#76a368] hover:text-[#5e8a52] transition-colors text-xs"
                                onclick={"toggleReadMore('#{item.topic.id}')"} id={"read-more-btn-#{item.topic.id}"}>
                          <svg class="w-3 h-3 transition-transform duration-200 down-carrot" fill="none" stroke="currentColor" viewBox="0 0 24 24" style="transform: rotate(0deg);">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7"></path>
                          </svg>
                          <span class="show-text">Read more</span>
                          <span class="hide-text hidden">Read less</span>
                        </button>

                        <!-- View Replies Button - Opens Modal -->
                        <button
                          class="view-replies-btn bg-[#76a368] hover:bg-[#5e8a52] text-white rounded px-3 py-1 text-xs font-medium transition-colors"
                          @click={"modalTopicId = '#{item.topic.id}'; showModal = true; document.body.style.overflow = 'hidden'"}
                        >
                          View replies
                        </button>
                      </div>
                    </div>
                  </div>

                  <!-- NEW REPLY INDICATOR -->
                  <div class="bg-green-50 border-l-4 border-green-400 -mt-4 mb-4 mx-4">
                    <div class="flex items-start gap-2 p-3">
                      <div class="flex items-center gap-2 flex-1 min-w-0">
                        <img src={item.user_avatar} class="w-6 h-6 rounded-full border border-gray-300 flex-shrink-0" />
                        <span class="text-sm font-medium text-gray-900"><%= item.user_name %></span>
                        <span class="text-sm text-gray-600">replied:</span>
                        <span class="text-sm text-gray-700 flex-1 min-w-0"><%= item.reply_text %></span>
                      </div>
                      <span class="text-xs text-gray-500 whitespace-nowrap flex-shrink-0">
                        <%= item.time_ago %>
                      </span>
                    </div>
                  </div>
                </div>
                <% else %>
                <!-- TYPE 2: NESTED REPLY TO COMMENT -->
                <div class="activity-nested-reply">
                  <div class="flex items-start gap-3 p-3 hover:bg-gray-50">
                    <img src={item.user_avatar} class="w-8 h-8 rounded-full border border-gray-300 flex-shrink-0" />
                    <div class="flex-1 min-w-0">
                      <div class="flex items-center gap-2 mb-2">
                        <span class="text-sm font-medium text-gray-900"><%= item.user_name %></span>
                        <span class="text-xs text-gray-500">replied to a comment in</span>
                        <span class="text-xs font-medium text-green-600"><%= item.group_name || "Community" %></span>
                      </div>

                      <!-- New Reply Content -->
                      <div class="pl-3 border-l-2 border-green-300">
                        <p class="text-sm text-gray-900 mb-2">
                          <%= if String.length(item.reply_text || "") > 150 do %>
                            <div>
                              <div id={"excerpt-#{item.id}"} class="line-clamp-3 text-gray-700">
                                <%= item.reply_text %>
                              </div>
                              <div id={"content-full-#{item.id}"} class="hidden">
                                <%= item.reply_text %>
                              </div>
                              <button
                                id={"read-more-btn-#{item.id}"}
                                class="read-more-btn mt-1 text-xs text-green-600 hover:text-green-700"
                                onclick={"toggleReadMore('#{item.id}')"}
                              >
                                <span>Read more</span>
                                <svg class="w-3 h-3 transition-transform inline-block ml-1" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7"></path>
                                </svg>
                              </button>
                            </div>
                          <% else %>
                            <%= item.reply_text %>
                          <% end %>
                        </p>

                        <div class="flex items-center justify-between mt-2">
                          <div class="text-xs text-gray-500">
                            <%= item.time_ago %>
                          </div>
                          <div class="flex items-center gap-3 text-xs text-gray-500">
                            <button class="hover:text-green-600 transition-colors">Like</button>
                            <button class="hover:text-green-600 transition-colors">Reply</button>
                            <button class="view-replies-btn bg-[#76a368] hover:bg-[#5e8a52] text-white rounded px-3 py-1 text-xs font-medium transition-colors">
                              View replies
                            </button>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              <% end %>
            <% else %>
              <!-- FALLBACK / OTHER ACTIVITY CARD -->
              <%= if item do %>
                <div class="activity-other">
                  <div class="flex items-start gap-3 p-3 hover:bg-gray-50">
                    <img src={item.user_avatar} class="w-8 h-8 rounded-full border border-gray-300 flex-shrink-0" />
                    <div class="flex-1 min-w-0">
                      <div class="flex items-start justify-between">
                        <div class="flex-1 min-w-0">
                          <p class="text-sm font-medium text-gray-900">
                            <%= build_title(item) %>
                          </p>
                          <%= if item.topic_title do %>
                            <p class="text-sm text-gray-600 mt-1"><%= item.topic_title %></p>
                          <% end %>
                        </div>
                        <div class="text-xs text-gray-500 whitespace-nowrap ml-2 flex-shrink-0">
                          <%= item.time_ago %>
                        </div>
                      </div>
                      <div class="flex items-center gap-2 mt-2 text-xs text-gray-500">
                        <span class="text-green-600 font-medium"><%= item.group_name || "Community" %></span>
                        <span>•</span>
                        <span><%= build_subtext(item) %></span>
                      </div>
                    </div>
                  </div>
                </div>
              <% end %>
            <% end %>
          <% end %>
        <% end %>
      </div>
    </div>

    <style>
      [x-cloak] { display: none !important; }

      .topics-container {
        position: relative;
        background-color: white;
      }

      .activity-notification {
        background-color: white;
        border-bottom: 1px solid #e5e7eb;
        transition: background-color 0.2s ease;
      }

      .activity-notification:last-child {
        border-bottom: none;
      }

      .activity-topic-reply {
        border-bottom: 1px solid #e5e7eb;
      }

      .activity-topic-reply:last-child {
        border-bottom: none;
      }

      .activity-nested-reply {
        background-color: white;
        border-bottom: 1px solid #e5e7eb;
        transition: background-color 0.2s ease;
      }

      .activity-nested-reply:last-child {
        border-bottom: none;
      }

      .activity-other {
        background-color: white;
        border-bottom: 1px solid #e5e7eb;
        transition: background-color 0.2s ease;
      }

      .activity-other:last-child {
        border-bottom: none;
      }

      .topic-card {
        background-color: white;
        border: none !important;
        border-radius: 0 !important;
        box-shadow: none !important;
        margin-bottom: 0.75rem !important;
        padding: 0.5rem 0.25rem;
        transition: transform 0.3s ease-out;
        border-bottom: 1px solid #e5e7eb !important;
      }

      .topic-card:last-child {
        border-bottom: none !important;
      }

      .view-replies-btn {
        background-color: #76a368;
        color: white;
        border-radius: 0.25rem;
        padding: 0.25rem 0.75rem;
        font-size: 0.75rem;
        font-weight: 500;
        transition: background-color 0.2s ease;
        border: none;
        cursor: pointer;
      }

      .view-replies-btn:hover {
        background-color: #5e8a52;
      }

      .line-clamp-2 {
        display: -webkit-box;
        -webkit-line-clamp: 2;
        -webkit-box-orient: vertical;
        overflow: hidden;
      }

      .line-clamp-3 {
        display: -webkit-box;
        -webkit-line-clamp: 3;
        -webkit-box-orient: vertical;
        overflow: hidden;
        line-height: 1.4;
      }

      .read-more-btn {
        display: inline-flex;
        align-items: center;
        background: none;
        border: none;
        cursor: pointer;
        font-size: 0.75rem;
        color: #76a368;
        padding: 0;
      }

      .read-more-btn:hover {
        color: #5e8a52;
      }

      .read-more-btn.rotated svg {
        transform: rotate(180deg);
      }
    </style>

    <script>
      window.toggleReadMore = function(topicId) {
        const excerpt = document.getElementById(`excerpt-${topicId}`);
        const fullContent = document.getElementById(`content-full-${topicId}`);
        const readMoreBtn = document.getElementById(`read-more-btn-${topicId}`);
        const thumbnail = document.getElementById(`thumbnail-${topicId}`);
        const leftCol = document.getElementById(`left-col-${topicId}`);
        const rightCol = document.getElementById(`right-col-${topicId}`);
        const topicCard = document.getElementById(`topic-${topicId}`);
        const btnText = readMoreBtn.querySelector('span');
        const btnSvg = readMoreBtn.querySelector('svg');

        if (excerpt.classList.contains('hidden')) {
          excerpt.classList.remove('hidden');
          fullContent.classList.add('hidden');
          btnText.textContent = 'Read more';
          readMoreBtn.classList.remove('rotated');
          btnSvg.style.transform = 'rotate(0deg)';

          if (thumbnail) {
            thumbnail.classList.remove('hidden');
          }
          if (rightCol) {
            rightCol.style.display = 'flex';
          }
          if (leftCol) {
            leftCol.style.width = '80%';
          }
          if (topicCard) {
            topicCard.style.backgroundColor = '';
          }

        } else {
          excerpt.classList.add('hidden');
          fullContent.classList.remove('hidden');
          btnText.textContent = 'Read less';
          readMoreBtn.classList.add('rotated');
          btnSvg.style.transform = 'rotate(180deg)';

          if (thumbnail) {
            thumbnail.classList.add('hidden');
          }
          if (rightCol) {
            rightCol.style.display = 'none';
          }
          if (leftCol) {
            leftCol.style.width = '100%';
          }
          if (topicCard) {
            topicCard.style.backgroundColor = 'white';
          }
        }
      };
    </script>
    """
  end
end
