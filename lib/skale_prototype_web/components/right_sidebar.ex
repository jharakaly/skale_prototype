defmodule SkalePrototypeWeb.Components.RightSidebar do
  use SkalePrototypeWeb, :components

  def right_sidebar(assigns) do
    ~H"""
    <div class="right-column">
      <!-- Search bar in sidebar -->
      <div class="search-container mb-6">
        <span class="search-icon">Search</span>
        <input type="text" placeholder="Search..." class="p-2 rounded text-base search-input w-full">
      </div>

      <div class="space-y-4">
        <!-- Events - Top -->
        <div class="collection-container relative overflow-hidden">
          <div class="collection-header">
            <h2 class="text-black text-base font-semibold">Events</h2>
            <a href="#" class="text-[#A3B18A] text-sm">See All</a>
          </div>
          <div class="gray-square relative">
            <div class="absolute inset-0 flex items-center justify-center">
              <span class="text-black text-lg font-bold rotate-12">Coming Soon</span>
            </div>
          </div>
          <div class="text-left mt-2">
            <p class="text-black text-xs">Date</p>
            <p class="text-black text-xs">Title</p>
          </div>
        </div>

        <!-- My Collection -->
        <div class="collection-container relative overflow-hidden">
          <div class="collection-header">
            <h2 class="text-black text-base font-semibold">My Collection</h2>
            <a href="#" class="text-[#A3B18A] text-sm">See All</a>
          </div>
          <div class="gray-square relative">
            <div class="absolute inset-0 flex items-center justify-center">
              <span class="text-black text-lg font-bold rotate-12">Coming Soon</span>
            </div>
          </div>
          <div class="text-left mt-2">
            <p class="text-black text-sm">Title</p>
            <p class="text-black text-xs">Subtitle</p>
          </div>
        </div>

        <!-- Featured -->
        <div class="collection-container relative overflow-hidden">
          <div class="collection-header">
            <h2 class="text-black text-base font-semibold">Featured</h2>
            <a href="#" class="text-[#A3B18A] text-sm">See All</a>
          </div>
          <div class="gray-square relative">
            <div class="absolute inset-0 flex items-center justify-center">
              <span class="text-black text-lg font-bold rotate-12">Coming Soon</span>
            </div>
          </div>
        </div>
      </div>
    </div>

    <style>
      .search-container {
        position: relative;
        margin-bottom: 1.5rem;
      }
      .search-icon {
        position: absolute;
        left: 1rem;
        top: 50%;
        transform: translateY(-50%);
        font-size: 1.2rem;
        color: #6b7280;
      }
      .search-input {
        padding-left: 3rem;
        width: 100%;
        background-color: white;
        border: 1px solid #e5e7eb;
        border-radius: 8px;
        box-shadow: 0 1px 2px rgba(0, 0, 0, 0.05);
        font-size: 1rem;
      }
      @media (max-width: 480px) {
        .search-input {
          font-size: 16px;
        }
      }

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
