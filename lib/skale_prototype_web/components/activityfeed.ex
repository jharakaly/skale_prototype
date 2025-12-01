  defmodule SkalePrototypeWeb.Components.ActivityFeed do
    use SkalePrototypeWeb, :components

    alias SkalePrototypeWeb.MockData
    alias SkalePrototypeWeb.Components.ActivityCard
    alias SkalePrototypeWeb.Components.TopicDetail

    # Public component API
    def activity_feed(assigns) do
      render(assigns)
    end

    def render(assigns) do
      feed =
        MockData.get_recent_activities()
        |> Enum.map(&convert_activity_to_item/1)
        |> Enum.reject(&is_nil/1)
        |> Enum.sort_by(& &1.timestamp, {:desc, NaiveDateTime})

      assigns = assign(assigns, :feed, feed)

      ~H"""
      <div id="activity-feed" class="topics-container activity-feed bg-white">
        <!-- Expanded detail views for reply activities -->
        <%= for item <- @feed, item.type == :reply, item.topic != nil do %>
          <%
            # Get the complete topic data with replies
            detailed_topic = get_detailed_topic_with_replies(item.topic)
          %>
          <div id={"activity-detail-#{item.id}"} style="display: none;" class="topic-detail-container">
            <TopicDetail.render topic={detailed_topic} topic_id={detailed_topic.id} />
          </div>
        <% end %>

        <!-- Activity cards -->
        <ActivityCard.activity_card :for={item <- @feed} item={item} />
      </div>

      <script>
        // Handle expand/collapse of replies
        document.addEventListener('click', function(e) {
          // Handle "View replies" button clicks
          if (e.target.classList.contains('view-replies-btn') ||
              e.target.closest('.view-replies-btn')) {
            const button = e.target.classList.contains('view-replies-btn') ?
                          e.target : e.target.closest('.view-replies-btn');
            const activityId = button.getAttribute('data-activity-id');
            const detailContainer = document.getElementById(`activity-detail-${activityId}`);

            if (detailContainer) {
              if (detailContainer.style.display === 'none') {
                detailContainer.style.display = 'block';
                button.textContent = 'Hide replies';
              } else {
                detailContainer.style.display = 'none';
                button.textContent = 'View replies';
              }
            }
          }

          // Handle "Read more" buttons for nested replies
          if (e.target.classList.contains('read-more-btn') ||
              e.target.closest('.read-more-btn')) {
            const button = e.target.classList.contains('read-more-btn') ?
                          e.target : e.target.closest('.read-more-btn');
            const repliesContainer = button.closest('.nested-replies');
            const hiddenReplies = repliesContainer.querySelectorAll('.hidden-reply');

            hiddenReplies.forEach(reply => {
              reply.classList.remove('hidden');
            });

            button.style.display = 'none';
          }
        });
      </script>

      <style>
        /* ============================================================
          CONTAINER
        ============================================================ */
        .topics-container.activity-feed {
          position: relative;
          background-color: white;
        }

        /* ============================================================
          SHARED CARD STYLE (modernized)
        ============================================================ */
        .activity-card {
          background-color: #ffffff;
          border-bottom: 1px solid #e5e7eb; /* single thin line between cards */
          border-radius: 12px;
          overflow: hidden;
          margin: 6px 0;
          box-shadow: 0 1px 3px rgba(15, 23, 42, 0.06);
          transition: background-color 0.18s ease, transform 0.18s ease,
                      box-shadow 0.18s ease;
        }

        .activity-card:hover {
          background-color: #fafafa;
          transform: translateY(-1px);
          box-shadow: 0 3px 6px rgba(15, 23, 42, 0.08);
        }

        .activity-card:last-child {
          border-bottom: none;
        }

        /* Optional variant hooks if you want to theme per type later */
        .activity-notification {}
        .activity-topic-reply {}
        .activity-nested-reply {}
        .activity-other {}

        /* ============================================================
          TOPIC CARD INSIDE ACTIVITY FEED
        ============================================================ */
        .topic-card {
          background-color: #ffffff;
          border: none !important;
          border-radius: 12px !important;
          padding: 0.75rem 0.75rem;
          box-shadow: 0 1px 2px rgba(15, 23, 42, 0.05) !important;
          margin-bottom: 0.75rem !important;
          border-bottom: 1px solid #e5e7eb !important; /* subtle divider inside the reply card */
        }

        .topic-card:last-child {
          border-bottom: none !important;
        }

        /* ============================================================
          ACTIVITY DETAIL CONTAINER STYLING (from subgroup_topics2)
        ============================================================ */
        .topic-detail-container {
          background-color: white;
          border: none; /* REMOVED: No border around replies container */
          border-radius: 0;
          padding: 0.75rem;
          box-shadow: none;
          margin-bottom: 0.75rem; /* Reduced from 1rem */
          border-bottom: 1px solid #e5e7eb !important; /* Added line for separation */
        }

        .topic-detail-container .topic-header {
          margin-bottom: 0.5rem !important;
        }

        .topic-detail-container .topic-excerpt {
          margin-bottom: 0.5rem !important;
        }

        .topic-detail-container .topic-stats {
          margin-bottom: 0.5rem !important;
        }

        .topic-detail-container .reply {
          padding: 0.25rem 0;
          border-bottom: 1px solid #f3f4f6;
        }

        .topic-detail-container .reply:last-child {
          border-bottom: none;
          padding-bottom: 0;
        }

        .topic-detail-container .reply:first-child {
          padding-top: 0;
        }

        .topic-detail-container .reply-content {
          padding-bottom: 0.25rem !important;
        }

        .topic-detail-container .reply-actions {
          margin-top: 0.125rem !important;
        }

        .topic-detail-container .reply-form {
          margin-top: 0.25rem !important;
        }

        .topic-detail-container .nested-replies {
          margin-top: 0.125rem !important;
        }

        /* Override any excessive padding/margin from the TopicDetail component */
        .topic-detail-container [class*="p-"] {
          padding: 0.25rem !important;
        }

        .topic-detail-container [class*="py-"] {
          padding-top: 0.125rem !important;
          padding-bottom: 0.125rem !important;
        }

        .topic-detail-container [class*="mb-"] {
          margin-bottom: 0.25rem !important;
        }

        .topic-detail-container [class*="mt-"] {
          margin-top: 0.125rem !important;
        }

        /* ============================================================
          TEXT UTILITIES
        ============================================================ */
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

        /* ============================================================
          READ MORE BUTTON
        ============================================================ */
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

        .read-more-btn svg {
          transition: transform 0.2s ease;
        }

        .read-more-btn.rotated svg {
          transform: rotate(180deg);
        }

        /* ============================================================
          VIEW REPLIES BUTTON STYLING
        ============================================================ */
        .view-replies-btn {
          background-color: #DDE5DD !important;
          color: #374151 !important;
          border: 1px solid #C8D6C8 !important;
          padding: 0.375rem 0.75rem;
          border-radius: 0.375rem;
          font-size: 0.75rem;
          cursor: pointer;
          transition: background-color 0.2s ease;
        }

        .view-replies-btn:hover {
          background-color: #C8D6C8 !important;
        }

        /* ============================================================
          REPLY BUTTON STYLING
        ============================================================ */
        .reply-btn {
          background-color: #76a368 !important;
          color: white !important;
          border: 1px solid #6a935d !important;
          padding: 0.375rem 0.75rem;
          border-radius: 0.375rem;
          font-size: 0.75rem;
          cursor: pointer;
          transition: background-color 0.2s ease;
        }

        .reply-btn:hover {
          background-color: #6a935d !important;
        }

        /* ============================================================
          TOPIC ACTIONS STYLING
        ============================================================ */
        .topic-actions {
          display: flex;
          align-items: center;
          gap: 0.5rem;
        }

        .content-container {
          position: relative;
        }

        .topic-text-content {
          position: relative;
        }

        .topic-content.cursor-pointer {
          cursor: pointer;
        }

        .topic-content.cursor-pointer:hover {
          background-color: #f9fafb;
          border-radius: 4px;
          padding: 0.25rem;
          margin: -0.25rem;
        }

        /* ============================================================
          HIDDEN UTILITY
        ============================================================ */

        .rotate-180 {
          transform: rotate(180deg);
        }
      </style>
      """
    end

    # ===============================================================
    # NEW FUNCTION: Get detailed topic with replies
    # ===============================================================
    defp get_detailed_topic_with_replies(topic) do
      # If this is the chocolate cake topic (ID 1), get the detailed version with replies
      if topic.id == 1 do
        MockData.get_topic_replies()
      else
        # For other topics, try to enhance with replies data if available
        case topic.id do
          id when is_integer(id) ->
            # Look for detailed topic data
            detailed = MockData.get_topic_replies()
            if detailed && detailed.id == id do
              detailed
            else
              # If no detailed version found, return the original topic
              # but ensure it has at least an empty replies array
              Map.put(topic, :replies, [])
            end
          _ ->
            # For fallback topics, ensure they have replies array
            Map.put(topic, :replies, [])
        end
      end
    end

    # ===============================================================
    # CONVERSION HELPERS - FIXED DATA STRUCTURE
    # ===============================================================

    defp convert_activity_to_item(%{type: :reply} = a) do
      target_content = Map.get(a, :target_content, "")

      reply_context =
        if String.contains?(target_content, "'"), do: :topic, else: :nested

      topic =
        if reply_context == :topic do
          find_topic_by_title(target_content)
        else
          find_topic_by_content(target_content)
        end

      time_ago_str =
        Map.get(a, :time_ago) ||
          Map.get(a, :reply_time_ago) ||
          "Recently"

      topic_with_updated_time =
        if topic do
          topic
          |> maybe_merge_full_content()
          |> Map.put(:time_ago, time_ago_str)
        else
          topic
        end

      parent_reply =
        if reply_context == :nested do
          %{
            user_name: extract_username(target_content) || "Community Member",
            content: extract_parent_content(target_content) ||
                      "Original comment in the thread",
            time_ago: "1 day ago"
          }
        else
          nil
        end

      user_name =
        Map.get(a, :user_name) ||
          Map.get(a, :reply_author) ||
          "Community Member"

      user_avatar =
        Map.get(a, :user_avatar) ||
          Map.get(a, :reply_avatar) ||
          "/images/default-avatar.png"

      group_name = Map.get(a, :group_name) || "Community"
      topic_title = Map.get(a, :topic_title) || target_content || "Discussion"

      %{
        id: "activity_#{Map.get(a, :id)}",
        type: :reply,
        reply_context: reply_context,
        topic: topic_with_updated_time,
        parent_reply: parent_reply,
        reply_text: extract_reply_text(a) || "New reply in the conversation",
        user_name: user_name,
        user_avatar: user_avatar,
        group_name: group_name,
        topic_title: topic_title,
        target_content: target_content,
        target_link: map_group_link(Map.get(a, :group_name)),
        time_ago: time_ago_str,
        timestamp: parse_time(time_ago_str)
      }
    end

    defp convert_activity_to_item(a) when is_map(a) do
      time_ago_str =
        Map.get(a, :time_ago) ||
          Map.get(a, :reply_time_ago) ||
          "Recently"

      type = Map.get(a, :type, :other)

      user_name =
        Map.get(a, :user_name) ||
          Map.get(a, :reply_author) ||
          "Community Member"

      user_avatar =
        Map.get(a, :user_avatar) ||
          Map.get(a, :reply_avatar) ||
          "/images/default-avatar.png"

      group_name = Map.get(a, :group_name) || "Community"
      target_content = Map.get(a, :target_content)
      topic_title = Map.get(a, :topic_title) || target_content || "Activity"

      # Handle like activities to show proper format
      liked_content =
        if type == :like do
          topic_title || target_content
        else
          nil
        end

      %{
        id: "activity_#{Map.get(a, :id)}",
        type: type,
        reply_context: nil,
        topic: nil,
        parent_reply: nil,
        reply_text: nil,
        user_name: user_name,
        user_avatar: user_avatar,
        group_name: group_name,
        topic_title: topic_title,
        target_content: target_content,
        target_link: map_group_link(Map.get(a, :group_name)),
        time_ago: time_ago_str,
        timestamp: parse_time(time_ago_str),
        liked_content: liked_content,
        mentioned_content: if(type == :mention, do: target_content, else: nil),
        # Add reply capability for mention activities
        show_reply_button: type == :mention
      }
    end

    defp convert_activity_to_item(_), do: nil

    # ===============================================================
    # DATA EXTRACTION HELPERS

    # Merge in full content for topics that have detailed replies data
    defp maybe_merge_full_content(topic) do
      # Currently get_topic_replies/0 returns a single map for the chocolate cake topic (id: 1)
      detailed = MockData.get_topic_replies()

      cond do
        is_map(detailed) and detailed[:id] == topic[:id] ->
          Map.merge(topic, %{
            content: detailed[:content],
            replies: detailed[:replies] || []
          })

        is_map(detailed) and detailed[:title] == topic[:title] ->
          Map.merge(topic, %{
            content: detailed[:content],
            replies: detailed[:replies] || []
          })

        true ->
          # Ensure topic has replies array
          Map.put(topic, :replies, [])
      end
    end

    # ===============================================================

    defp find_topic_by_title(title) when is_binary(title) do
      MockData.get_all_topics()
      |> Enum.find(fn topic ->
        String.contains?(title, String.slice(topic.title || "", 0, 10)) ||
          String.contains?(topic.title || "", String.slice(title, 0, 10))
      end)
      |> case do
        nil -> create_fallback_topic(title)
        topic -> topic
      end
    end

    defp find_topic_by_title(_), do: create_fallback_topic("Discussion")

    defp find_topic_by_content(content) when is_binary(content) do
      MockData.get_all_topics()
      |> Enum.find(fn topic ->
        String.contains?(content, String.slice(topic.title || "", 0, 5)) ||
          String.contains?(topic.content || "", String.slice(content, 0, 5))
      end)
      |> case do
        nil -> create_fallback_topic("Community Discussion")
        topic -> topic
      end
    end

    defp find_topic_by_content(_), do: create_fallback_topic("Community Discussion")

    defp create_fallback_topic(title) do
      clean_title =
        if String.contains?(title, "on your post") do
          case Regex.run(~r/'([^']+)'/, title) do
            [_, extracted_title] -> extracted_title
            _ -> title
          end
        else
          title
        end

      %{
        id: "fallback_#{System.unique_integer([:positive])}",
        title: clean_title,
        excerpt: "Recent activity in the community",
        content: "This topic has recent activity that you're involved in.",
        reply_count: 3,
        time_ago: "Recently",
        avatars: [
          "https://i.pravatar.cc/150?img=1",
          "https://i.pravatar.cc/150?img=2"
        ],
        additional_count: 1,
        media: [],
        replies: []  # Ensure fallback topics have empty replies array
      }
    end

    defp extract_reply_text(%{reply_excerpt: excerpt}) when is_binary(excerpt) and excerpt != "",
      do: excerpt

    defp extract_reply_text(%{target_content: content}) when is_binary(content),
      do: String.slice(content, 0, 100) <> "..."

    defp extract_reply_text(_), do: "Participated in the discussion"

    defp extract_username(content) when is_binary(content) do
      case Regex.run(~r/(?:@|by\s+)(\w+)/, content) do
        [_, username] -> String.capitalize(username)
        _ -> "Community Member"
      end
    end

    defp extract_username(_), do: "Community Member"

    defp extract_parent_content(content) when is_binary(content) do
      if String.length(content) > 50 do
        String.slice(content, 0, 100) <> "..."
      else
        content
      end
    end

    defp extract_parent_content(_), do: "Original comment in the thread"

    # ===============================================================
    # HELPERS
    # ===============================================================

    defp parse_time(time) when is_binary(time) do
      # Very simple relative time parser based on suffix
      cleaned = String.trim(time)

      cond do
        cleaned == "" or cleaned == "Recently" ->
          NaiveDateTime.utc_now()

        String.contains?(cleaned, "min") ->
          {n, _} = Integer.parse(String.replace(cleaned, ~r/[^0-9]/, ""))
          NaiveDateTime.add(NaiveDateTime.utc_now(), -n * 60)

        String.contains?(cleaned, "hour") or String.contains?(cleaned, "hr") ->
          {n, _} = Integer.parse(String.replace(cleaned, ~r/[^0-9]/, ""))
          NaiveDateTime.add(NaiveDateTime.utc_now(), -n * 3600)

        String.contains?(cleaned, "day") ->
          {n, _} = Integer.parse(String.replace(cleaned, ~r/[^0-9]/, ""))
          NaiveDateTime.add(NaiveDateTime.utc_now(), -n * 86_400)

        true ->
          NaiveDateTime.utc_now()
      end
    end

    defp parse_time(_), do: NaiveDateTime.utc_now()

    defp map_group_link("Community Culture"), do: "/subgroup_building_culture"
    defp map_group_link("Vegan Baking"), do: "/subgroup_topics2"
    defp map_group_link("South Shore Eats"), do: "/group_south_shore_eats"
    defp map_group_link(_), do: "#"
  end
