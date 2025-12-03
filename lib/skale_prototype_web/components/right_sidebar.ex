defmodule SkalePrototypeWeb.Components.RightSidebar do
  use SkalePrototypeWeb, :components

  def right_sidebar(assigns) do
    ~H"""
    <div class="right-column">
      <!-- Search bar in sidebar - Updated to match Building Culture and have same width as events -->
      <div class="search-wrapper">
        <div class="search-container">
          <span class="search-icon">Search</span>
          <input type="text" placeholder="Search..." class="p-2 rounded text-base search-input w-full">
        </div>
      </div>

      <div class="space-y-4">
        <!-- Events -->
        <div class="collection-container events-container relative overflow-hidden">
          <div class="collection-header">
            <h2 class="text-black text-base font-semibold">Events</h2>
            <a href="#" class="text-[#A3B18A] text-sm">See All</a>
          </div>

          <div class="events-list overflow-y-auto max-h-full pr-1">
            <.event_item
              title="In the Kitchen - with Chef JP Person"
              type="live"
              location="Cambridge, MA"
              date="January 5, 2026"
            />
            <.event_item
              title="Weekly Class - Host Cabot Earle"
              type="virtual"
              location="Zoom link"
              date="January 7, 2026"
            />
            <.event_item
              title="Weekly Class - Host Cabot Earle"
              type="virtual"
              location="Zoom link"
              date="January 14, 2026"
            />
            <.event_item
              title="In the Community - with Farmer Sarah Smith"
              type="live"
              location="Cohasset, MA"
              date="January 10, 2026"
            />
          </div>
        </div>
      </div>
    </div>

    <style>
      /* ============================================
         Search Wrapper - Same 95% width as events container
         ============================================ */
      .search-wrapper {
        width: 95%;
        margin-left: auto;
        margin-right: auto;
        margin-bottom: 1.5rem;
      }

      /* ============================================
         Search Container - MATCHES BUILDING CULTURE
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
         Events Container (95% width - matches search bar)
         ============================================ */
      .collection-container {
        display: flex;
        flex-direction: column;
        background-color: white;
        border: 1px solid #e5e7eb;
        border-radius: 12px;
        padding: 1.5rem;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.05);
        margin-bottom: 1.5rem;
        min-height: 400px;
        flex-grow: 1;
        height: 90%;
      }

      .events-container {
        width: 95%;
        margin-left: auto;
        margin-right: auto;
        display: flex;
        flex-direction: column;
        height: 90%;
      }

      @media (max-width: 480px) {
        .collection-container {
          padding: 1rem;
          margin-bottom: 1rem;
          min-height: 350px;
        }
      }

      .collection-header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 0.75rem;
      }

      .events-list {
        flex: 1;
        overflow-y: auto;
        min-height: 300px;
      }
      .event-item {
        background: white;
        padding: 0.75rem 0;
        position: relative;
      }
      .event-title {
        font-weight: 600;
        font-size: 0.875rem;
        color: #111;
      }
      .event-meta {
        font-size: 0.75rem;
        color: #4b5563;
        margin: 0.25rem 0;
      }
      .event-type {
        font-weight: 600;
      }
      .virtual { color: #3b82f6; }
      .inperson,
      .live { color: #22c55e; }
      .event-learn-more {
        font-size: 0.75rem;
        color: #A3B18A;
        font-weight: 500;
        text-align: right;
        margin-top: 0.5rem;
      }
      .dismiss-btn {
        position: absolute;
        top: -5px;
        right: 0;
        font-size: 1.1rem;
        color: #9ca3af;
        cursor: pointer;
      }
      .event-divider {
        height: 1px;
        background-color: #e5e7eb;
        margin: 0.75rem 0;
      }
      .image-placeholder {
        width: 25%;
        height: 50px;
        background-color: #e5e7eb;
        margin: 6px 0;
      }
    </style>
    """
  end

  defp event_item(assigns) do
    ~H"""
    <div class="event-item">
      <button class="dismiss-btn">x</button>
      <div class="event-title"><%= @title %></div>

      <div class="image-placeholder"></div>

      <div class="event-meta">
        <span class={"event-type #{if @type == "virtual", do: "virtual", else: "live"}"}>
          <%= if @type == "virtual", do: "Virtual event (Zoom)", else: "LIVE event (advance registration required)" %>
        </span>
      </div>

      <div class="event-meta">
        Location: <%= @location %> • Date: <%= @date %>
      </div>

      <div class="event-learn-more">
        <a href="#">Register here</a>
      </div>
      <div class="event-divider"></div>
    </div>
    """
  end
end
