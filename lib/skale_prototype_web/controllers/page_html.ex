defmodule SkalePrototypeWeb.PageHTML do
  use SkalePrototypeWeb, :html

  import SkalePrototypeWeb.Components.TopicCard
  import SkalePrototypeWeb.Components.TopicDetail

  embed_templates "page_html/*"
end
