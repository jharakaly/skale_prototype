defmodule SkalePrototypeWeb.Components.Homepage do
  use SkalePrototypeWeb, :components
  alias SkalePrototypeWeb.Components.ActivityFeed
  alias SkalePrototypeWeb.Components.RightSidebar

  def render(assigns) do
    # Ensures @active_tab always exists
    assigns = assign_new(assigns, :active_tab, fn -> "groups" end)

    ~H"""
    <div class="container">
      <div class="main-content">
        <!-- Left Content Column -->
        <div class="left-column">
          <!-- "What's on your mind?" bar -->
          <div class="whats-on-mind-bar" id="whats-on-mind-bar" style="margin-top: 1rem; margin-bottom: 1rem;">
            <div class="profile-avatar">
              <div class="avatar-initials">Y</div>
            </div>
            <div class="whats-on-mind-input">
              <input
                type="text"
                placeholder="What's on your mind?"
                class="whats-on-mind-input-field"
                readonly
              />
            </div>
          </div>

          <!-- Button group -->
          <div class="button-group">
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

          <div class="groups-container">
            <%= if @active_tab == "groups" do %>
              <!-- Vegan Cookbook Club Card (CARD 1 – DEBUG TARGET) -->
              <div class="group-card" phx-click="navigate_to_group" phx-value-group="vegan-cookbook">
                <div class="group-header flex items-stretch">
                  <div class="group-info flex flex-col justify-between">
                    <div>
                      <h2 class="text-black text-base font-semibold">Vegan Cookbook Club</h2>
                      <p
                        class="group-description"
                        id="group-desc-1"
                        data-expanded="false"
                      >
                        Explore plant-based recipes, share cooking tips, and discover delicious vegan meals together.
                        Explore plant-based recipes, share cooking tips, and discover delicious vegan meals together.
                        Explore plant-based recipes, share cooking tips, and discover delicious vegan meals together.
                        Explore plant-based recipes, share cooking tips, and discover delicious vegan meals together.
                        Explore plant-based recipes, share cooking tips, and discover delicious vegan meals together.
                        Explore plant-based recipes, share cooking tips, and discover delicious vegan meals together.
                        Explore plant-based recipes, share cooking tips, and discover delicious vegan meals together.
                        Explore plant-based recipes, share cooking tips, and discover delicious vegan meals together.
                        Explore plant-based recipes, share cooking tips, and discover delicious vegan meals together.
                        Explore plant-based recipes, share cooking tips, and discover delicious vegan meals together.
                        Explore plant-based recipes, share cooking tips, and discover delicious vegan meals together.
                        Explore plant-based recipes, share cooking tips, and discover delicious vegan meals together.
                        Explore plant-based recipes, share cooking tips, and discover delicious vegan meals together.
                        Explore plant-based recipes, share cooking tips, and discover delicious vegan meals together.
                        Explore plant-based recipes, share cooking tips, and discover delicious vegan meals together.
                        Explore plant-based recipes, share cooking tips, and discover delicious vegan meals together.
                        Explore plant-based recipes, share cooking tips, and discover delicious vegan meals together.
                      </p>
                      <p class="text-black text-sm">700 members · 5 new topics · 44 replies</p>
                    </div>

                    <div
                      class="group-read-more mt-2"
                      onclick="toggleGroupReadMore(1, event)"
                    >
                      <span class="group-read-more-text">Read more</span>
                      <svg class="read-more-icon" viewBox="0 0 24 24" fill="none" stroke="currentColor">
                        <path
                          stroke-linecap="round"
                          stroke-linejoin="round"
                          stroke-width="2"
                          d="M19 9l-7 7-7-7"
                        />
                        <path
                          stroke-linecap="round"
                          stroke-linejoin="round"
                          stroke-width="2"
                          d="M19 5l-7 7-7-7"
                        />
                      </svg>
                    </div>
                  </div>
                  <div class="group-avatar"></div>
                </div>
                <!-- Latest Reply (REPLY 1 – DEBUG TARGET) -->
                <div class="latest-reply">
                  <div class="reply-avatar">C</div>
                  <div class="reply-content">
                    <div class="reply-meta">
                      <span class="reply-author">cabot</span>
                      <span class="reply-time">5m</span>
                    </div>
                    <p
                      class="text-black text-sm reply-body"
                      id="reply-body-1"
                      data-expanded="false"
                    >
                      We successfully made our first baked vegan mac and cheese from the cookbook and it was absolutely
                      delicious! The cashew-based sauce was surprisingly creamy.
                      We successfully made our first baked vegan mac and cheese from the cookbook and it was absolutely
                      delicious! The cashew-based sauce was surprisingly creamy.
                      We successfully made our first baked vegan mac and cheese from the cookbook and it was absolutely
                      delicious! The cashew-based sauce was surprisingly creamy.
                    </p>

                    <!-- Reply Read More -->
                    <div
                      class="reply-read-more"
                      onclick="toggleReplyReadMore(1, event)"
                    >
                      <span class="reply-read-more-text">Read more</span>
                      <svg class="read-more-icon" viewBox="0 0 24 24" fill="none" stroke="currentColor">
                        <path
                          stroke-linecap="round"
                          stroke-linejoin="round"
                          stroke-width="2"
                          d="M19 9l-7 7-7-7"
                        />
                        <path
                          stroke-linecap="round"
                          stroke-linejoin="round"
                          stroke-width="2"
                          d="M19 5l-7 7-7-7"
                        />
                      </svg>
                    </div>

                    <!-- Reply actions (text only, with vertical separator) -->
                    <div class="reply-actions flex items-center mt-2 text-xs text-gray-700 ml-2">
                      <span class="cursor-pointer">Like</span>
                      <span class="mx-1">|</span>
                      <span class="cursor-pointer">Reply</span>
                    </div>
                  </div>
                </div>
              </div>

              <!-- South Shore Eats Card (unchanged except longer text you added) -->
              <div class="group-card" phx-click="navigate_to_group" phx-value-group="south-shore-eats">
                <div class="group-header">
                  <div class="group-info">
                    <h2 class="text-black text-base font-semibold">South Shore Eats</h2>
                    <p class="group-description">
                      Discover local restaurants, food events, and culinary experiences across the South Shore region.
                      Discover local restaurants, food events, and culinary experiences across the South Shore region.
                      Discover local restaurants, food events, and culinary experiences across the South Shore region.
                      Discover local restaurants, food events, and culinary experiences across the South Shore region.
                      Discover local restaurants, food events, and culinary experiences across the South Shore region.
                      Discover local restaurants, food events, and culinary experiences across the South Shore region.
                      Discover local restaurants, food events, and culinary experiences across the South Shore region.
                    </p>
                    <p class="text-black text-sm">1k members · 7 new topics · 56 replies</p>

                    <div class="group-read-more">
                      <span class="group-read-more-text">Read more</span>
                      <svg class="read-more-icon" viewBox="0 0 24 24" fill="none" stroke="currentColor">
                        <path
                          stroke-linecap="round"
                          stroke-linejoin="round"
                          stroke-width="2"
                          d="M19 9l-7 7-7-7"
                        />
                        <path
                          stroke-linecap="round"
                          stroke-linejoin="round"
                          stroke-width="2"
                          d="M19 5l-7 7-7-7"
                        />
                      </svg>
                    </div>
                  </div>
                  <div class="group-avatar"></div>
                </div>
                <!-- Latest Reply -->
                <div class="latest-reply">
                  <div class="reply-avatar">C</div>
                  <div class="reply-content">
                    <div class="reply-meta">
                      <span class="reply-author">Christina</span>
                      <span class="reply-time">1hr</span>
                    </div>
                    <p class="text-black text-sm">
                      The farmers market in Cohasset will feature a new raw bar on Saturday with fresh oysters from
                      local farms. They're also hosting a cooking demonstration!
                    </p>
                  </div>
                  <!-- Reply icon -->
                  <div class="reply-icon-container">
                    <svg class="reply-icon" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                      <path
                        stroke-linecap="round"
                        stroke-linejoin="round"
                        stroke-width="2"
                        d="M3 10h10a8 8 0 018 8v2M3 10l6 6m-6-6l6-6"
                      />
                    </svg>
                  </div>
                </div>
              </div>

              <!-- Building Skale Card (unchanged) -->
              <div class="group-card" phx-click="navigate_to_group" phx-value-group="building-skale">
                <div class="group-header">
                  <div class="group-info">
                    <h2 class="text-black text-base font-semibold">Building Skale</h2>
                    <p class="group-description">
                      Join the development journey of Skale platform - share ideas, report bugs, and help shape our community.
                    </p>
                    <p class="text-black text-sm">500 members · 12 new topics · 89 replies</p>

                    <div class="group-read-more">
                      <span class="group-read-more-text">Read more</span>
                      <svg class="read-more-icon" viewBox="0 0 24 24" fill="none" stroke="currentColor">
                        <path
                          stroke-linecap="round"
                          stroke-linejoin="round"
                          stroke-width="2"
                          d="M19 9l-7 7-7-7"
                        />
                        <path
                          stroke-linecap="round"
                          stroke-linejoin="round"
                          stroke-width="2"
                          d="M19 5l-7 7-7-7"
                        />
                      </svg>
                    </div>
                  </div>
                  <div class="group-avatar"></div>
                </div>
                <!-- Latest Reply -->
                <div class="latest-reply">
                  <div class="reply-avatar">A</div>
                  <div class="reply-content">
                    <div class="reply-meta">
                      <span class="reply-author">alex</span>
                      <span class="reply-time">2hr</span>
                    </div>
                    <p class="text-black text-sm">
                      Just pushed the new homepage design with improved group layouts and better mobile responsiveness.
                      Let me know what you think about the latest updates!
                    </p>
                  </div>
                  <!-- Reply icon -->
                  <div class="reply-icon-container">
                    <svg class="reply-icon" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                      <path
                        stroke-linecap="round"
                        stroke-linejoin="round"
                        stroke-width="2"
                        d="M3 10h10a8 8 0 018 8v2M3 10l6 6m-6-6l6-6"
                      />
                    </svg>
                  </div>
                </div>
              </div>
            <% else %>
              <!-- ACTIVITY FEED -->
              <ActivityFeed.activity_feed />
            <% end %>
          </div>
        </div>

        <!-- Right Sidebar Column -->
        <div class="right-column">
          <RightSidebar.right_sidebar />
        </div>
      </div>
    </div>

    <script>
      // Minimal, non-LiveView click handler for the "What's on your mind?" bar
      document.addEventListener('DOMContentLoaded', function() {
        const whatsOnMindBar = document.getElementById('whats-on-mind-bar');

        if (whatsOnMindBar) {
          whatsOnMindBar.addEventListener('click', function(event) {
            event.preventDefault();
            event.stopPropagation();

            const newPostModal = document.getElementById('new-post-modal');
            const overlay = document.getElementById('modal-overlay');

            if (newPostModal) {
              newPostModal.classList.remove('hidden');
            }
            if (overlay) {
              overlay.classList.remove('hidden');
            }

            // Lock scroll while modal is open
            document.body.style.overflow = 'hidden';
          });
        }
      });

      // GROUP CARD READ MORE TOGGLER (only wired for card 1 right now)
      window.toggleGroupReadMore = function(id, event) {
        if (event) {
          event.stopPropagation();
          event.preventDefault();
        }

        const desc = document.getElementById(`group-desc-${id}`);
        const btn = event.currentTarget;
        const textSpan = btn.querySelector('.group-read-more-text');
        const icon = btn.querySelector('.read-more-icon');

        if (!desc || !btn) return;

        const expanded = desc.classList.contains('expanded');

        if (expanded) {
          desc.classList.remove('expanded');
          btn.classList.remove('expanded');
          if (textSpan) textSpan.textContent = 'Read more';
          if (icon) icon.style.transform = 'rotate(0deg)';
        } else {
          desc.classList.add('expanded');
          btn.classList.add('expanded');
          if (textSpan) textSpan.textContent = 'Read less';
          if (icon) icon.style.transform = 'rotate(180deg)';
        }
      };

      // REPLY READ MORE TOGGLER (only wired for reply 1 right now)
      window.toggleReplyReadMore = function(id, event) {
        if (event) {
          event.stopPropagation();
          event.preventDefault();
        }

        const desc = document.getElementById(`reply-body-${id}`);
        const btn = event.currentTarget;
        const textSpan = btn.querySelector('.reply-read-more-text');
        const icon = btn.querySelector('.read-more-icon');

        if (!desc || !btn) return;

        const expanded = desc.classList.contains('expanded');

        if (expanded) {
          desc.classList.remove('expanded');
          btn.classList.remove('expanded');
          if (textSpan) textSpan.textContent = 'Read more';
          if (icon) icon.style.transform = 'rotate(0deg)';
        } else {
          desc.classList.add('expanded');
          btn.classList.add('expanded');
          if (textSpan) textSpan.textContent = 'Read less';
          if (icon) icon.style.transform = 'rotate(180deg)';
        }
      };

      // Existing helpers (unchanged)
      window.toggleReadMore = function(topicId) {
        const excerpt = document.getElementById(`excerpt-${topicId}`);
        const fullContent = document.getElementById(`content-full-${topicId}`);
        const readMoreBtn = document.getElementById(`read-more-btn-${topicId}`);
        const thumbnail = document.getElementById(`thumbnail-${topicId}`);
        const leftCol = document.getElementById(`left-col-${topicId}`);
        const rightCol = document.getElementById(`right-col-${topicId}`);
        const topicCard = document.getElementById(`topic-${topicId}`);

        if (!excerpt || !fullContent || !readMoreBtn) {
          return;
        }

        const btnText = readMoreBtn.querySelector('span');
        const btnSvg = readMoreBtn.querySelector('svg');

        if (excerpt.classList.contains('hidden')) {
          excerpt.classList.remove('hidden');
          fullContent.classList.add('hidden');
          if (btnText) btnText.textContent = 'Read more';
          if (btnSvg) btnSvg.style.transform = 'rotate(0deg)';

          if (thumbnail) thumbnail.classList.remove('hidden');
          if (rightCol) rightCol.style.display = 'flex';
          if (leftCol) leftCol.style.width = '80%';
          if (topicCard) topicCard.style.backgroundColor = '';
        } else {
          excerpt.classList.add('hidden');
          fullContent.classList.remove('hidden');
          if (btnText) btnText.textContent = 'Read less';
          if (btnSvg) btnSvg.style.transform = 'rotate(180deg)';

          if (thumbnail) thumbnail.classList.add('hidden');
          if (rightCol) rightCol.style.display = 'none';
          if (leftCol) leftCol.style.width = '100%';
          if (topicCard) topicCard.style.backgroundColor = 'white';
        }
      };

      window.toggleTopicDetail = function(topicId) {
        const container = document.getElementById(`topic-detail-${topicId}`);
        const button = document.querySelector(`.view-replies-btn[phx-value-topic-id="${topicId}"]`);
        if (!container || !button) return;

        const isHidden = container.classList.contains('hidden');

        if (isHidden) {
          container.classList.remove('hidden');
          container.style.maxHeight = 'none';
          const targetHeight = container.scrollHeight;
          container.style.maxHeight = '0px';
          requestAnimationFrame(function() {
            container.style.maxHeight = targetHeight + 'px';
          });
          button.textContent = 'Hide replies';
        } else {
          const currentHeight = container.scrollHeight;
          container.style.maxHeight = currentHeight + 'px';
          requestAnimationFrame(function() {
            container.style.maxHeight = '0px';
          });
          setTimeout(function() {
            container.classList.add('hidden');
          }, 300);
          button.textContent = 'View replies';
        }
      };
    </script>
    """
  end
end
