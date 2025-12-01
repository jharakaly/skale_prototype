defmodule SkalePrototypeWeb.Components.ActivityCard do
  use SkalePrototypeWeb, :components

  # Public component API
  attr :item, :map, required: true
  def activity_card(assigns) do
    ~H"""
    <%= if @item do %>
      <%= case {@item.type, @item.reply_context} do %>
        <% {:reply, :topic} -> %>
          <%!-- ======================= TOPIC REPLY CARD ======================= --%>
          <div class="activity-card activity-topic-reply border-b">
            <!-- TOPIC CARD WITH UPDATED TIMESTAMP -->
            <div id={"topic-#{@item.topic.id}"} class="topic-card p-4">
              <% media_list = @item.topic[:media] || [] %>
              <div class="flex justify-between items-start gap-4">
                <!-- Main content -->
                <div id={"left-col-#{@item.topic.id}"}
                     class="flex-1 min-w-0"
                     style="width: 80%;">
                  <div class="topic-header mb-2">
                    <div class="topic-content cursor-pointer"
                         onclick={"toggleReadMore('#{@item.topic.id}')"}>
                      <h3 class="topic-title font-semibold text-gray-900 text-base mb-1">
                        <%= @item.topic.title %>
                      </h3>

                      <!-- Collapsed Excerpt -->
                      <div id={"excerpt-#{@item.topic.id}"}
                           class="text-gray-700 text-sm break-words line-clamp-3">
                        <%= @item.topic.excerpt %>
                      </div>

                      <!-- Expanded Full Content -->
                      <div id={"content-full-#{@item.topic.id}"} class="hidden">
                        <%= if media_list != [] do %>
                          <div class="mb-4 flex justify-center">
                            <div class="max-w-2xl w-full">
                              <%= for media <- media_list do %>
                                <%= if media.type == "image" do %>
                                  <div class="rounded-lg overflow-hidden mb-2 flex justify-center">
                                    <img src={media.url}
                                         alt="Post image"
                                         class="max-w-full h-auto max-h-80 object-contain" />
                                  </div>
                                <% else %>
                                  <%= if media.type == "video" do %>
                                    <div class="rounded-lg overflow-hidden mb-2 flex justify-center">
                                      <iframe src={media.url}
                                              class="w-full h-64"
                                              frameborder="0"
                                              allowfullscreen>
                                      </iframe>
                                    </div>
                                  <% end %>
                                <% end %>
                              <% end %>
                            </div>
                          </div>
                        <% end %>

                        <%= if @item.topic[:content] do %>
                          <p class="text-gray-700 mb-6 text-sm break-words whitespace-pre-line">
                            <%= @item.topic[:content] %>
                          </p>
                        <% end %>
                      </div>
                    </div>
                  </div>
                </div>

                <!-- Time & Thumbnail -->
                <div id={"right-col-#{@item.topic.id}"}
                     class="flex flex-col items-end space-y-2 flex-shrink-0"
                     style="width: 20%;">
                  <div class="text-xs text-gray-500 whitespace-nowrap w-full text-right">
                    <%= @item.time_ago %>
                  </div>

                  <%= if media_list != [] do %>
                    <div id={"thumbnail-#{@item.topic.id}"}
                         class="w-full rounded overflow-hidden border border-gray-200 flex-shrink-0">
                      <%= for media <- Enum.take(media_list, 1) do %>
                        <%= if media.type == "image" do %>
                          <img src={media.url}
                               alt="Thumbnail"
                               class="w-full h-20 object-cover" />
                        <% else %>
                          <%= if media.type == "video" do %>
                            <div class="w-full h-20 bg-gray-100 flex items-center justify-center">
                              <svg class="w-8 h-8 text-gray-400"
                                   fill="none"
                                   stroke="currentColor"
                                   viewBox="0 0 24 24">
                                <path stroke-linecap="round"
                                      stroke-linejoin="round"
                                      stroke-width="2"
                                      d="M14.752 11.168l-3.197-2.132A1 1 0 0010 9.87v4.263a1 1 0 001.555.832l3.197-2.132a1 1 0 000-1.664z">
                                </path>
                                <path stroke-linecap="round"
                                      stroke-linejoin="round"
                                      stroke-width="2"
                                      d="M21 12a9 9 0 11-18 0 9 9 0 0118 0z">
                                </path>
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
                  <span class="text-xs text-gray-600">
                    <%= @item.topic.reply_count %> replies
                  </span>

                  <%= if @item.topic.avatars != [] do %>
                    <div class="topic-avatars flex -space-x-1">
                      <%= for avatar <- Enum.take(@item.topic.avatars, 3) do %>
                        <div class="w-4 h-4 rounded-full flex items-center justify-center text-xs text-white font-medium border border-white bg-[#8fb382]">
                          <%= avatar %>
                        </div>
                      <% end %>

                      <%= if @item.topic.additional_count && @item.topic.additional_count > 0 do %>
                        <div class="w-4 h-4 bg-gray-300 rounded-full flex items-center justify-center text-xs text-gray-600 font-medium border border-white">
                          +<%= @item.topic.additional_count %>
                        </div>
                      <% end %>
                    </div>
                  <% end %>
                </div>

                <!-- Topic Actions with View Replies Button -->
                <div class="topic-actions flex gap-2">
                  <!-- View Replies Button -->
                  <button
                    type="button"
                    class="view-replies-btn bg-[#76a368] hover:bg-[#5e8a52] text-white rounded px-3 py-1 text-xs font-medium transition-colors"
                    phx-value-topic-id={@item.topic.id}
                    onclick={"toggleTopicDetail('#{@item.topic.id}')"}
                    id={"view-replies-btn-#{@item.topic.id}"}
                  >
                    View replies
                  </button>

                  <!-- Read More Button -->
                  <button
                    class="read-more-btn flex items-center space-x-1 text-[#76a368] hover:text-[#5e8a52] transition-colors text-xs"
                    onclick={"toggleReadMore('#{@item.topic.id}')"}
                    id={"read-more-btn-#{@item.topic.id}"}
                  >
                    <svg
                      class="w-3 h-3 transition-transform duration-200"
                      fill="none"
                      stroke="currentColor"
                      viewBox="0 0 24 24"
                      style="transform: rotate(0deg);"
                    >
                      <path
                        stroke-linecap="round"
                        stroke-linejoin="round"
                        stroke-width="2"
                        d="M19 9l-7 7-7-7"
                      >
                      </path>
                    </svg>
                    <span>Read more</span>
                  </button>
                </div>
              </div>
            </div>

            <!-- NEW REPLY INDICATOR -->
            <div class="bg-green-50 border-l-4 border-green-400 -mt-4 mb-4 mx-4">
              <div class="flex items-start gap-2 p-3">
                <div class="flex items-center gap-2 flex-1 min-w-0">
                  <img src={@item.user_avatar}
                       class="w-6 h-6 rounded-full border border-gray-300 flex-shrink-0" />
                  <span class="text-sm font-medium text-gray-900">
                    <%= @item.user_name %>
                  </span>
                  <span class="text-sm text-gray-600">replied:</span>
                  <span class="text-sm text-gray-700 flex-1 min-w-0">
                    <%= @item.reply_text || @item.reply_excerpt %>
                  </span>
                </div>
                <span class="text-xs text-gray-500 whitespace-nowrap flex-shrink-0">
                  <%= @item.time_ago %>
                </span>
              </div>
            </div>

            <!-- Topic Detail Container (Hidden by default; expands below card) -->
            <div
              id={"topic-detail-#{@item.topic.id}"}
              class="topic-detail-container hidden overflow-hidden transition-all duration-300 ease-in-out"
              style="max-height: 0;"
            >
              <SkalePrototypeWeb.Components.TopicDetail.render
                topic={@item.topic}
                topic_id={@item.topic.id}
              />
            </div>
          </div>

        <% {:reply, :nested} -> %>
          <%!-- ======================= NESTED REPLY CARD ======================= --%>
          <div class="activity-card activity-nested-reply border-b">
            <div class="flex items-start gap-3 p-3">
              <img src={@item.user_avatar}
                   class="w-8 h-8 rounded-full border border-gray-300 flex-shrink-0" />
              <div class="flex-1 min-w-0">
                <div class="flex items-center gap-2 mb-2">
                  <span class="text-sm font-medium text-gray-900">
                    <%= @item.user_name %>
                  </span>
                  <span class="text-xs text-gray-500">replied to a comment in</span>
                  <span class="text-xs font-medium text-green-600">
                    <%= @item.group_name || "Community" %>
                  </span>
                </div>

                <!-- Parent Reply Context -->
                <%= if @item.parent_reply do %>
                  <div class="bg-gray-50 rounded px-3 py-2 mb-2 border border-gray-200">
                    <div class="flex items-center gap-2 mb-1">
                      <span class="text-xs font-medium text-gray-700">
                        <%= @item.parent_reply.user_name %>
                      </span>
                      <span class="text-xs text-gray-500">•</span>
                      <span class="text-xs text-gray-500">
                        <%= @item.parent_reply.time_ago %>
                      </span>
                    </div>
                    <p class="text-xs text-gray-600 line-clamp-2">
                      <%= @item.parent_reply.content %>
                    </p>
                  </div>
                <% end %>

                <!-- New Reply Content -->
                <div class="pl-3 border-l-2 border-green-300">
                  <p class="text-sm text-gray-900 mb-2">
                    <%= if String.length(@item.reply_text || "") > 150 do %>
                      <div>
                        <div id={"excerpt-#{@item.id}"}
                             class="line-clamp-3 text-gray-700">
                          <%= @item.reply_text %>
                        </div>
                        <div id={"content-full-#{@item.id}"} class="hidden">
                          <%= @item.reply_text %>
                        </div>
                        <button id={"read-more-btn-#{@item.id}"}
                                class="read-more-btn mt-1 text-xs text-green-600 hover:text-green-700"
                                onclick={"toggleReadMore('#{@item.id}')"}>
                          <span>Read more</span>
                          <svg class="w-3 h-3 transition-transform inline-block ml-1"
                               fill="none"
                               stroke="currentColor"
                               viewBox="0 0 24 24">
                            <path stroke-linecap="round"
                                  stroke-linejoin="round"
                                  stroke-width="2"
                                  d="M19 9l-7 7-7-7">
                            </path>
                          </svg>
                        </button>
                      </div>
                    <% else %>
                      <%= @item.reply_text %>
                    <% end %>
                  </p>

                  <div class="flex items-center justify-between mt-2">
                    <div class="text-xs text-gray-500">
                      <%= @item.time_ago %>
                    </div>
                    <div class="flex items-center gap-3 text-xs text-gray-500">
                      <button class="hover:text-green-600 transition-colors">Like</button>
                      <button class="hover:text-green-600 transition-colors">Reply</button>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>

        <% {type, _} when type in [:like, :mention, :follow] -> %>
          <%!-- ========================== NOTIFICATION CARD ========================== --%>
          <div class="activity-card activity-notification border-b">
            <div class="flex items-start gap-3 p-3">
              <img src={@item.user_avatar}
                   class="w-8 h-8 rounded-full border border-gray-300 flex-shrink-0" />
              <div class="flex-1 min-w-0">
                <div class="flex items-start justify-between">
                  <div class="flex-1 min-w-0">
                    <% topic_title = Map.get(@item, :topic_title) %>
                    <p class="text-sm text-gray-900 font-medium">
                      <%= case @item.type do %>
                        <% :like -> %>
                          <%= @item.user_name %> liked your post
                          <%= if topic_title do %>
                            “<%= topic_title %>”
                          <% end %>
                        <% :mention -> %>
                          <%= @item.user_name %> mentioned you
                          <%= if topic_title do %>
                            in "<%= topic_title %>"
                          <% end %>
                        <% :follow -> %>
                          <%= @item.user_name %> started following you
                        <% _ -> %>
                          <%= @item.user_name %> has a new update related to you
                      <% end %>
                    </p>

                    <%= if @item.type == :mention and @item.target_content do %>
                      <p class="text-sm text-gray-600 mt-1 line-clamp-2">
                        <%= @item.target_content %>
                      </p>
                    <% end %>

                    <!-- Show target content for follow activities -->
                    <%= if @item.type == :follow and @item.target_content do %>
                      <p class="text-xs text-gray-500 mt-1">
                        <%= @item.target_content %>
                      </p>
                    <% end %>
                  </div>
                  <div class="text-xs text-gray-500 whitespace-nowrap ml-2 flex-shrink-0">
                    <%= @item.time_ago %>
                  </div>
                </div>

                <div class="flex items-center gap-2 mt-2 text-xs text-gray-500">
                  <span class="text-green-600 font-medium">
                    <%= @item.group_name || "Community" %>
                  </span>
                </div>

                <div class="flex gap-3 mt-2 text-xs">
                  <%= if topic_title && @item.type != :follow do %>
                    <a href={@item.target_link || "#"}
                       class="text-[#76a368] hover:underline">
                      View post
                    </a>
                  <% end %>

                  <%= if @item.type == :mention do %>
                    <button class="reply-btn text-white px-3 py-1 rounded text-xs">
                      Reply
                    </button>
                  <% end %>

                  <%= if @item.type == :follow do %>
                    <button class="text-[#76a368] hover:underline">
                      View profile
                    </button>
                  <% end %>
                </div>
              </div>
            </div>
          </div>

        <% _ -> %>
          <%!-- ======================= MULTI-TYPE PROJECT / GROUP CARDS ======================= --%>
          <div class="activity-card activity-multi border-b">
            <div class="flex gap-4 p-4">
              <.left_column activity={@item} />

              <div class="flex-1 min-w-0">
                <%= case @item.type do %>
                  <% :subgroup_created -> %>      <.subgroup_created activity={@item} />
                  <% :topic_created -> %>         <.topic_created activity={@item} />
                  <% :topic_liked -> %>           <.topic_liked activity={@item} />
                  <% :reply_liked -> %>           <.reply_liked activity={@item} />
                  <% :mention -> %>               <.mention activity={@item} />
                  <% :project_joined -> %>        <.project_joined activity={@item} />
                  <% :project_left -> %>          <.project_left activity={@item} />
                  <% :invite_sent -> %>           <.invite_sent activity={@item} />
                  <% :invite_accepted -> %>       <.invite_status activity={@item} status="accepted" />
                  <% :invite_declined -> %>       <.invite_status activity={@item} status="declined" />
                  <% :task_created -> %>          <.task_created activity={@item} />
                  <% :task_assigned -> %>         <.task_assigned activity={@item} />
                  <% :task_completed -> %>        <.task_completed activity={@item} />
                  <% :file_uploaded -> %>         <.file_uploaded activity={@item} />
                  <% :topic_edited -> %>          <.topic_edited activity={@item} />
                  <% :topic_deleted -> %>         <.topic_deleted activity={@item} />
                  <% :topic_pinned -> %>          <.topic_pinned activity={@item} status="pinned" />
                  <% :topic_unpinned -> %>        <.topic_pinned activity={@item} status="unpinned" />
                  <% :followed -> %>              <.followed activity={@item} status="followed" />
                  <% :unfollowed -> %>            <.followed activity={@item} status="unfollowed" />
                  <% :shared_externally -> %>     <.shared_externally activity={@item} />
                  <% :poll_started -> %>          <.poll_started activity={@item} />
                  <% :poll_voted -> %>            <.poll_voted activity={@item} />
                  <% :tag_added -> %>             <.tag_changed activity={@item} action="added" />
                  <% :tag_removed -> %>           <.tag_changed activity={@item} action="removed" />
                  <% :milestone_reached -> %>     <.milestone_reached activity={@item} />
                  <% :file_commented -> %>        <.file_commented activity={@item} />
                  <% :task_mentioned -> %>        <.task_mentioned activity={@item} />
                  <% :due_date_changed -> %>      <.due_date_changed activity={@item} />
                  <% :emoji_reaction -> %>        <.emoji_reaction activity={@item} />
                  <% :project_archived -> %>      <.project_status activity={@item} status="archived" />
                  <% :project_closed -> %>        <.project_status activity={@item} status="closed" />
                  <% _ -> %>                      <.generic activity={@item} />
                <% end %>
              </div>

              <.time_ago time={@item.time_ago} />
            </div>
          </div>
      <% end %>
    <% end %>
    """
  end

  # ─────────────────────────────────────
  # LEFT COLUMN – Avatar + participants
  # ─────────────────────────────────────

  attr :activity, :map, required: true
  defp left_column(assigns) do
    ~H"""
    <div class="flex flex-col items-center gap-2">
      <img src={@activity.user_avatar} class="w-10 h-10 rounded-full border" />

      <% participants = Map.get(@activity, :participants, []) %>

      <%= if is_list(participants) and length(participants) > 0 do %>
        <div class="flex -space-x-2">
          <%= for p <- Enum.take(participants, 4) do %>
            <img src={p} class="w-7 h-7 rounded-full border-2 border-white" />
          <% end %>

          <%= if length(participants) > 4 do %>
            <div class="w-7 h-7 rounded-full bg-gray-300 flex items-center justify-center text-xs">
              +<%= length(participants) - 4 %>
            </div>
          <% end %>
        </div>
      <% end %>
    </div>
    """
  end

  attr :time, :string, required: true
  defp time_ago(assigns) do
    ~H"""
    <div class="text-xs text-gray-500 ml-auto whitespace-nowrap">
      <%= @time %>
    </div>
    """
  end

  # ─────────────────────────────────────
  # 30+ TYPE-SPECIFIC CARD BODIES
  # ─────────────────────────────────────

  defp subgroup_created(assigns) do
    ~H"""
    <% breadcrumb = Map.get(@activity, :breadcrumb, []) %>
    <p class="text-sm">
      <strong><%= @activity.user_name %></strong> created a new project space
    </p>
    <p class="text-xs text-gray-500 mt-1">
      <%= Enum.join(breadcrumb, " → ") %>
    </p>
    <div class="mt-3 flex gap-3">
      <a href={@activity.target_link || "#"}
         class="text-xs text-[#76a368] hover:underline">
        Open project
      </a>
      <button class="text-xs px-3 py-1 bg-[#76a368] text-white rounded hover:bg-[#5e8a52]">
        Join project
      </button>
    </div>
    """
  end

  defp topic_created(assigns) do
    ~H"""
    <% breadcrumb = Map.get(@activity, :breadcrumb, []) %>
    <% title = Map.get(@activity, :title) || Map.get(@activity, :topic_title) %>
    <p class="text-sm">
      <strong><%= @activity.user_name %></strong> started a new discussion topic
    </p>
    <%= if title do %>
      <p class="text-sm font-medium mt-1">
        "<%= title %>"
      </p>
    <% end %>
    <p class="text-xs text-gray-500 mt-1">
      <%= Enum.join(breadcrumb, " → ") %>
    </p>
    <div class="mt-3 flex gap-3 text-xs">
      <a href={@activity.target_link || "#"}
         class="text-[#76a368] hover:underline">
        View topic
      </a>
      <button class="text-[#76a368] hover:underline">
        Reply to topic
      </button>
    </div>
    """
  end

  defp topic_liked(assigns) do
    ~H"""
    <% breadcrumb = Map.get(@activity, :breadcrumb, []) %>
    <% topic_title = Map.get(@activity, :topic_title) %>
    <p class="text-sm">
      <strong><%= @activity.user_name %></strong> liked your topic
      <%= if topic_title do %>
        "<%= topic_title %>"
      <% end %>
    </p>
    <p class="text-xs text-gray-500 mt-1">
      <%= Enum.join(breadcrumb, " → ") %>
    </p>
    <div class="mt-3 flex gap-3 text-xs">
      <a href={@activity.target_link || "#"}
         class="text-[#76a368] hover:underline">
        View topic
      </a>
      <button class="text-gray-600 hover:text-[#76a368]">
        View all likes
      </button>
    </div>
    """
  end

  defp reply_liked(assigns) do
    ~H"""
    <% breadcrumb = Map.get(@activity, :breadcrumb, []) %>
    <% topic_title = Map.get(@activity, :topic_title) %>
    <p class="text-sm">
      <strong><%= @activity.user_name %></strong> liked one of your replies
      <%= if topic_title do %>
        in "<%= topic_title %>"
      <% end %>
    </p>
    <p class="text-xs text-gray-500 mt-1">
      <%= Enum.join(breadcrumb, " → ") %>
    </p>
    <div class="mt-3 flex gap-3 text-xs">
      <a href={@activity.target_link || "#"}
         class="text-[#76a368] hover:underline">
        Jump to reply
      </a>
      <button class="text-gray-600 hover:text-[#76a368]">
        View conversation
      </button>
    </div>
    """
  end

  defp mention(assigns) do
    ~H"""
    <% breadcrumb = Map.get(@activity, :breadcrumb, []) %>
    <% topic_title = Map.get(@activity, :topic_title) %>
    <p class="text-sm">
      <strong><%= @activity.user_name %></strong> mentioned you
      <%= if topic_title do %>
        in "<%= topic_title %>"
      <% end %>
    </p>

    <!-- Show the actual mention content -->
    <%= if @activity.target_content do %>
      <p class="text-sm text-gray-600 mt-1">
        <%= @activity.target_content %>
      </p>
    <% end %>

    <p class="text-xs text-gray-500 mt-1">
      <%= Enum.join(breadcrumb, " → ") %>
    </p>

    <div class="mt-3 flex gap-3 text-xs">
      <a href={@activity.target_link || "#"}
         class="text-[#76a368] hover:underline">
        View mention
      </a>
      <button class="reply-btn text-white px-3 py-1 rounded">
        Reply
      </button>
    </div>
    """
  end

  defp project_joined(assigns) do
    ~H"""
    <% breadcrumb = Map.get(@activity, :breadcrumb, []) %>
    <% project_name = Map.get(@activity, :project_name) %>
    <p class="text-sm">
      <strong><%= @activity.user_name %></strong> joined project
      <%= if project_name do %>
        "<%= project_name %>"
      <% end %>
    </p>
    <p class="text-xs text-gray-500 mt-1">
      <%= Enum.join(breadcrumb, " → ") %>
    </p>
    <div class="mt-3 flex gap-3 text-xs">
      <a href={@activity.target_link || "#"}
         class="text-[#76a368] hover:underline">
        View project
      </a>
      <button class="text-[#76a368] hover:underline">
        View team
      </button>
    </div>
    """
  end

  defp project_left(assigns) do
    ~H"""
    <% breadcrumb = Map.get(@activity, :breadcrumb, []) %>
    <% project_name = Map.get(@activity, :project_name) %>
    <p class="text-sm">
      <strong><%= @activity.user_name %></strong> left project
      <%= if project_name do %>
        "<%= project_name %>"
      <% end %>
    </p>
    <p class="text-xs text-gray-500 mt-1">
      <%= Enum.join(breadcrumb, " → ") %>
    </p>
    <div class="mt-3 flex gap-3 text-xs">
      <a href={@activity.target_link || "#"}
         class="text-[#76a368] hover:underline">
        View project
      </a>
      <button class="text-[#76a368] hover:underline">
        View team
      </button>
    </div>
    """
  end

  defp invite_sent(assigns) do
    ~H"""
    <% breadcrumb = Map.get(@activity, :breadcrumb, []) %>
    <% project_name = Map.get(@activity, :project_name) %>
    <p class="text-sm">
      <strong><%= @activity.user_name %></strong> sent invitations for
      <%= if project_name do %>
        "<%= project_name %>"
      <% end %>
    </p>
    <p class="text-xs text-gray-500 mt-1">
      <%= Enum.join(breadcrumb, " → ") %>
    </p>
    <div class="mt-3 flex gap-3 text-xs">
      <a href={@activity.target_link || "#"}
         class="text-[#76a368] hover:underline">
        Review invitations
      </a>
    </div>
    """
  end

  defp invite_status(assigns) do
    ~H"""
    <% breadcrumb = Map.get(@activity, :breadcrumb, []) %>
    <% project_name = Map.get(@activity, :project_name) %>
    <p class="text-sm">
      <strong><%= @activity.user_name %></strong> <%= @status %> your invitation
      <%= if project_name do %>
        to "<%= project_name %>"
      <% end %>
    </p>
    <p class="text-xs text-gray-500 mt-1">
      <%= Enum.join(breadcrumb, " → ") %>
    </p>
    <div class="mt-3 flex gap-3 text-xs">
      <a href={@activity.target_link || "#"}
         class="text-[#76a368] hover:underline">
        View project
      </a>
    </div>
    """
  end

  defp task_created(assigns) do
    ~H"""
    <% breadcrumb = Map.get(@activity, :breadcrumb, []) %>
    <% title = Map.get(@activity, :title) %>
    <% due_date = Map.get(@activity, :due_date) %>
    <p class="text-sm">
      <strong><%= @activity.user_name %></strong> created a new task
    </p>
    <%= if title do %>
      <p class="text-sm font-medium mt-1">
        "<%= title %>"
      </p>
    <% end %>
    <p class="text-xs text-gray-500 mt-1">
      <%= Enum.join(breadcrumb, " → ") %>
      <%= if due_date do %>
        • Due <%= due_date %>
      <% end %>
    </p>
    <div class="mt-3 flex gap-3 text-xs">
      <a href={@activity.target_link || "#"}
         class="text-[#76a368] hover:underline">
        View task
      </a>
      <button class="text-[#76a368] hover:underline">
        Assign or edit
      </button>
    </div>
    """
  end

  defp task_assigned(assigns) do
    ~H"""
    <% breadcrumb = Map.get(@activity, :breadcrumb, []) %>
    <% title = Map.get(@activity, :title) %>
    <% due_date = Map.get(@activity, :due_date) %>
    <p class="text-sm">
      <strong><%= @activity.user_name %></strong> assigned you a task
    </p>
    <%= if title do %>
      <p class="text-sm font-medium mt-1">
        "<%= title %>"
      </p>
    <% end %>
    <p class="text-xs text-gray-500 mt-1">
      <%= Enum.join(breadcrumb, " → ") %>
      <%= if due_date do %>
        • Due <span class="text-red-600"><%= due_date %></span>
      <% end %>
    </p>
    <div class="mt-3 flex gap-3 text-xs">
      <a href={@activity.target_link || "#"}
         class="text-[#76a368] hover:underline">
        Open task
      </a>
      <button class="text-[#76a368] hover:underline">
        Update status
      </button>
    </div>
    """
  end

  defp task_completed(assigns) do
    ~H"""
    <% breadcrumb = Map.get(@activity, :breadcrumb, []) %>
    <% title = Map.get(@activity, :title) %>
    <p class="text-sm">
      <strong><%= @activity.user_name %></strong> completed a task 🎉
    </p>
    <%= if title do %>
      <p class="text-sm font-medium mt-1">
        "<%= title %>"
      </p>
    <% end %>
    <p class="text-xs text-gray-500 mt-1">
      <%= Enum.join(breadcrumb, " → ") %>
    </p>
    <div class="mt-3 flex gap-3 text-xs">
      <a href={@activity.target_link || "#"}
         class="text-[#76a368] hover:underline">
        View task details
      </a>
      <button class="text-[#76a368] hover:underline">
        View project status
      </button>
    </div>
    """
  end

  defp file_uploaded(assigns) do
    ~H"""
    <% breadcrumb = Map.get(@activity, :breadcrumb, []) %>
    <% file_name = Map.get(@activity, :file_name) %>
    <p class="text-sm">
      <strong><%= @activity.user_name %></strong> uploaded a file to this project
    </p>
    <p class="text-xs text-gray-500 mt-1">
      <%= Enum.join(breadcrumb, " → ") %>
    </p>
    <div class="flex items-center gap-3 mt-2">
      <div class="w-12 h-12 bg-gray-200 border-2 border-dashed rounded"></div>
      <div>
        <p class="font-medium text-sm">
          <%= file_name %>
        </p>
        <a href={@activity.target_link || "#"}
           class="text-xs text-[#76a368] hover:underline mt-1 inline-block">
          Open file
        </a>
      </div>
    </div>
    """
  end

  defp topic_edited(assigns) do
    ~H"""
    <% breadcrumb = Map.get(@activity, :breadcrumb, []) %>
    <% topic_title = Map.get(@activity, :topic_title) %>
    <p class="text-sm">
      <strong><%= @activity.user_name %></strong> edited a discussion post
    </p>
    <%= if topic_title do %>
      <p class="text-sm font-medium mt-1">
        "<%= topic_title %>"
        <span class="text-gray-500 text-xs align-middle">(updated)</span>
      </p>
    <% end %>
    <p class="text-xs text-gray-500 mt-1">
      <%= Enum.join(breadcrumb, " → ") %>
    </p>
    <div class="mt-3 flex gap-3 text-xs">
      <a href={@activity.target_link || "#"}
         class="text-[#76a368] hover:underline">
        View updated post
      </a>
      <button class="text-[#76a368] hover:underline">
        Reply
      </button>
    </div>
    """
  end

  defp topic_deleted(assigns) do
    ~H"""
    <% topic_title = Map.get(@activity, :topic_title) %>
    <p class="text-sm text-gray-700">
      <strong><%= @activity.user_name %></strong> removed a post
      <%= if topic_title do %>
        related to "<%= topic_title %>"
      <% end %>
      <span class="italic text-gray-500"> (no longer visible)</span>
    </p>
    """
  end

  defp topic_pinned(assigns) do
    ~H"""
    <% breadcrumb = Map.get(@activity, :breadcrumb, []) %>
    <% topic_title = Map.get(@activity, :topic_title) %>
    <p class="text-sm">
      <strong><%= @activity.user_name %></strong> <%= @status %> a topic
      <%= if topic_title do %>
        "<%= topic_title %>"
      <% end %>
      at the top of this space
    </p>
    <p class="text-xs text-gray-500 mt-1">
      <%= Enum.join(breadcrumb, " → ") %>
    </p>
    <div class="mt-3 flex gap-3 text-xs">
      <a href={@activity.target_link || "#"}
         class="text-[#76a368] hover:underline">
        View topic
      </a>
    </div>
    """
  end

  defp followed(assigns) do
    ~H"""
    <% breadcrumb = Map.get(@activity, :breadcrumb, []) %>
    <% topic_title = Map.get(@activity, :topic_title) %>
    <p class="text-sm">
      <strong><%= @activity.user_name %></strong> <%= @status %> this
      <%= if topic_title do %>
        topic/project: "<%= topic_title %>"
      <% end %>
    </p>
    <p class="text-xs text-gray-500 mt-1">
      <%= Enum.join(breadcrumb, " → ") %>
    </p>
    <div class="mt-3 flex gap-3 text-xs">
      <a href={@activity.target_link || "#"}
         class="text-[#76a368] hover:underline">
        View followers
      </a>
    </div>
    """
  end

  defp shared_externally(assigns) do
    ~H"""
    <% network = Map.get(@activity, :network) %>
    <% project_name = Map.get(@activity, :project_name) %>
    <p class="text-sm">
      <strong><%= @activity.user_name %></strong> shared
      <%= if project_name do %>
        "<%= project_name %>"
      <% else %>
        this update
      <% end %>
      externally on <%= network %>
    </p>
    <div class="mt-3 flex gap-3 text-xs">
      <a href={@activity.target_link || "#"}
         class="text-[#76a368] hover:underline">
        View linked post
      </a>
    </div>
    """
  end

  defp poll_started(assigns) do
    ~H"""
    <% breadcrumb = Map.get(@activity, :breadcrumb, []) %>
    <% topic_title = Map.get(@activity, :topic_title) %>
    <p class="text-sm">
      <strong><%= @activity.user_name %></strong> started a poll
      <%= if topic_title do %>
        "<%= topic_title %>"
      <% end %>
    </p>
    <p class="text-xs text-gray-500 mt-1">
      <%= Enum.join(breadcrumb, " → ") %>
    </p>
    <div class="mt-3 flex gap-3 text-xs">
      <a href={@activity.target_link || "#"}
         class="text-[#76a368] hover:underline">
        View poll
      </a>
      <button class="px-3 py-1 bg-[#76a368] text-white rounded text-xs">
        Vote now
      </button>
    </div>
    """
  end

  defp poll_voted(assigns) do
    ~H"""
    <% topic_title = Map.get(@activity, :topic_title) %>
    <p class="text-sm">
      <strong><%= @activity.user_name %></strong> voted in a poll
      <%= if topic_title do %>
        "<%= topic_title %>"
      <% end %>
    </p>
    <div class="mt-3 flex gap-3 text-xs">
      <a href={@activity.target_link || "#"}
         class="text-[#76a368] hover:underline">
        View poll results
      </a>
    </div>
    """
  end

  defp tag_changed(assigns) do
    ~H"""
    <% tag = Map.get(@activity, :tag) %>
    <p class="text-sm">
      <strong><%= @activity.user_name %></strong> <%= @action %> the tag
      <span class="px-2 py-1 bg-gray-200 rounded text-xs align-middle ml-1">
        <%= tag %>
      </span>
    </p>
    <div class="mt-3">
      <a href={@activity.target_link || "#"}
         class="text-xs text-[#76a368] hover:underline">
        View tagged item
      </a>
    </div>
    """
  end

  defp milestone_reached(assigns) do
    ~H"""
    <% title = Map.get(@activity, :title) %>
    <p class="text-lg font-bold text-green-600">Milestone reached! 🎉</p>
    <p class="font-medium mt-1">
      <%= title %>
    </p>
    <div class="mt-3">
      <a href={@activity.target_link || "#"}
         class="text-xs text-[#76a368] hover:underline">
        View milestone details
      </a>
    </div>
    """
  end

  defp file_commented(assigns) do
    ~H"""
    <% file_name = Map.get(@activity, :file_name) %>
    <p class="text-sm">
      <strong><%= @activity.user_name %></strong> commented on the file
      <%= if file_name do %>
        "<%= file_name %>"
      <% end %>
    </p>
    <div class="mt-3 flex gap-3 text-xs">
      <a href={@activity.target_link || "#"}
         class="text-[#76a368] hover:underline">
        View comments
      </a>
      <button class="text-[#76a368] hover:underline">
        Add a reply
      </button>
    </div>
    """
  end

  defp task_mentioned(assigns) do
    ~H"""
    <% title = Map.get(@activity, :title) %>
    <p class="text-sm">
      <strong><%= @activity.user_name %></strong> mentioned you in task
      <%= if title do %>
        "<%= title %>"
      <% end %>
    </p>
    <div class="mt-3">
      <a href={@activity.target_link || "#"}
         class="text-xs text-[#76a368] hover:underline">
        Open task
      </a>
    </div>
    """
  end

  defp due_date_changed(assigns) do
    ~H"""
    <% title = Map.get(@activity, :title) %>
    <% due_date = Map.get(@activity, :due_date) %>
    <p class="text-sm">
      <strong><%= @activity.user_name %></strong> changed the due date
      <%= if title do %>
        for "<%= title %>"
      <% end %>
      <%= if due_date do %>
        to <%= due_date %>
      <% end %>
    </p>
    <div class="mt-3">
      <a href={@activity.target_link || "#"}
         class="text-xs text-[#76a368] hover:underline">
        View task
      </a>
    </div>
    """
  end

  defp emoji_reaction(assigns) do
    ~H"""
    <% emoji = Map.get(@activity, :emoji, "🎉") %>
    <% topic_title = Map.get(@activity, :topic_title) %>
    <div class="flex flex-col items-center text-center">
      <div class="text-5xl mb-2"><%= emoji %></div>
      <p class="text-sm">
        <strong><%= @activity.user_name %></strong> reacted
        <%= emoji %>
        <%= if topic_title do %>
          to your post "<%= topic_title %>"
        <% else %>
          to one of your posts
        <% end %>
      </p>
      <div class="mt-3">
        <a href={@activity.target_link || "#"}
           class="text-xs text-[#76a368] hover:underline">
          View post
        </a>
      </div>
    </div>
    """
  end

  defp project_status(assigns) do
    ~H"""
    <% project_name = Map.get(@activity, :project_name) %>
    <p class="text-sm">
      <strong><%= @activity.user_name %></strong> <%= @status %> the project
      <%= if project_name do %>
        "<%= project_name %>"
      <% end %>
    </p>
    <div class="mt-3">
      <a href={@activity.target_link || "#"}
         class="text-xs text-[#76a368] hover:underline">
        View project summary
      </a>
    </div>
    """
  end

  defp generic(assigns) do
    ~H"""
    <p class="text-sm">
      <strong><%= @activity.user_name %></strong> did something related to your work.
    </p>
    """
  end
end
