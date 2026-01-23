defmodule SkalePrototypeWeb.Components.RightSidebarGroupStats do
  use SkalePrototypeWeb, :components

  def right_sidebar_group_stats(assigns) do
    ~H"""
    <div class="right-column">
      <!-- Search bar in sidebar - EXACTLY same as original RightSidebar -->
      <div class="search-wrapper">
        <div class="search-container">
          <span class="search-icon">Search</span>
          <input
            type="text"
            placeholder="Search..."
            class="p-2 rounded text-base search-input w-full"
          >
        </div>
      </div>

      <div class="space-y-4">
        <!-- Group Stats -->
        <div class="collection-container">
          <h3 class="sidebar-title">Group Stats</h3>
          <div class="member-item">
            <div class="member-info">
              <div class="member-name">412 members</div>
              <div class="member-role">Active community</div>
            </div>
          </div>
          <div class="member-item">
            <div class="member-info">
              <div class="member-name">24 topics</div>
              <div class="member-role">This month</div>
            </div>
          </div>
          <div class="member-item">
            <div class="member-info">
              <div class="member-name">87% engagement</div>
              <div class="member-role">Active participation</div>
            </div>
          </div>
        </div>

        <!-- Group Members -->
        <div class="collection-container">
          <h3 class="sidebar-title">Group Members</h3>
          <div class="member-item">
            <div class="member-avatar">JH</div>
            <div class="member-info">
              <div class="member-name">James Harakaly</div>
              <div class="member-role">Community Director</div>
            </div>
          </div>
          <div class="member-item">
            <div class="member-avatar" style="background-color: #588157;">SC</div>
            <div class="member-info">
              <div class="member-name">Sarah Chen</div>
              <div class="member-role">Moderator</div>
            </div>
          </div>
          <div class="member-item">
            <div class="member-avatar" style="background-color: #3A5A40;">AM</div>
            <div class="member-info">
              <div class="member-name">Alex Martinez</div>
              <div class="member-role">Moderator</div>
            </div>
          </div>
          <button class="join-btn">Join Community Culture</button>
        </div>

        <!-- Related Groups -->
        <div class="collection-container">
          <h3 class="sidebar-title">Related Groups</h3>
          <div class="member-item">
            <div class="member-avatar" style="background-color: #A3B18A; border-radius: 6px;"></div>
            <div class="member-info">
              <div class="member-name">Onboarding</div>
              <div class="member-role">355 members</div>
            </div>
          </div>
          <div class="member-item">
            <div class="member-avatar" style="background-color: #588157; border-radius: 6px;"></div>
            <div class="member-info">
              <div class="member-name">Mentorship &amp; Growth</div>
              <div class="member-role">187 members</div>
            </div>
          </div>
          <div class="member-item">
            <div class="member-avatar" style="background-color: #3A5A40; border-radius: 6px;"></div>
            <div class="member-info">
              <div class="member-name">Platform Development</div>
              <div class="member-role">298 members</div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <style>
      /* ============================================
         Search Wrapper - same 95% width as original events container
         ============================================ */
      .search-wrapper {
        width: 95%;
        margin-left: auto;
        margin-right: auto;
        margin-bottom: 1.5rem;
      }

      /* ============================================
         Search Container - EXACTLY as in RightSidebar
         ============================================ */
      .search-container {
        position: relative;
        width: 100%;
      }

      .search-icon {
        position: absolute;
        left: 1rem;
        top: 50%;
        transform: translateY(-50%);
        font-size: 1rem;
        color: #6b7280;
      }

      .search-input {
        padding-left: 3rem !important;
        width: 100%;
        background-color: white;
        border: 1px solid #e5e7eb;
        border-radius: 8px;
        box-shadow: 0 1px 2px rgba(0, 0, 0, 0.05);
        font-size: 0.9rem;
        padding-top: 0.4rem;
        padding-bottom: 0.4rem;
        height: auto;
        line-height: 1.2;
      }

      /* ============================================
         Sidebar cards (replacing Events)
         ============================================ */
      .collection-container {
        width: 95%;
        margin-left: auto;
        margin-right: auto;
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

      .sidebar-title {
        font-size: 1.1rem;
        font-weight: 600;
        color: #374151;
        margin-bottom: 1rem;
      }

      .member-item {
        display: flex;
        align-items: center;
        gap: 0.75rem;
        padding: 0.5rem 0;
      }

      .member-avatar {
        width: 2.5rem;
        height: 2.5rem;
        border-radius: 50%;
        background-color: #A3B18A;
        display: flex;
        align-items: center;
        justify-content: center;
        color: white;
        font-weight: bold;
        flex-shrink: 0;
      }

      .member-info {
        flex: 1;
      }

      .member-name {
        font-weight: 500;
        color: #374151;
      }

      .member-role {
        font-size: 0.875rem;
        color: #6b7280;
      }

      .join-btn {
        width: 100%;
        background-color: #A3B18A;
        color: white;
        border: none;
        border-radius: 8px;
        padding: 0.75rem 1rem;
        font-weight: 500;
        cursor: pointer;
        transition: background-color 0.2s;
        margin-top: 1rem;
      }

      .join-btn:hover {
        background-color: #8a9a7b;
      }
    </style>
    """
  end
end
