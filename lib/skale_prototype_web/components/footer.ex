defmodule SkalePrototypeWeb.Components.Footer do
  use SkalePrototypeWeb, :components

  def footer(assigns) do
    ~H"""
    <footer class="bg-[#DDE5DD] border-t border-gray-300 mt-8 max-w-[1200px] mx-auto">
      <div class="px-4 py-4 flex flex-col sm:flex-row items-center justify-between gap-2 text-sm text-gray-700 w-full">
        <div class="flex items-center gap-2">
          <span class="font-semibold">Skale</span>
          <span>·</span>
          <span>© 2025 Skale. All rights reserved.</span>
        </div>

        <div class="flex flex-wrap items-center gap-4">
          <a href="#" class="hover:underline">About</a>
          <a href="#" class="hover:underline">Terms</a>
          <a href="#" class="hover:underline">Privacy</a>
          <a href="#" class="hover:underline">Contact</a>
        </div>
      </div>
    </footer>
    """
  end
end
