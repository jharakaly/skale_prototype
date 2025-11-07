defmodule SkalePrototypeWeb.PageHTML do
  use SkalePrototypeWeb, :html

  # NO IMPORTS — they cause errors
  # import SkalePrototypeWeb.Components.TopicCards
  # import SkalePrototypeWeb.Components.TopicDetail
  # import SkalePrototypeWeb.Components.RightSidebar

  embed_templates "page_html/*"
end
