defmodule SkalePrototypeWeb.Router do
  use SkalePrototypeWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", SkalePrototypeWeb do
  pipe_through :browser

  # Home page (main LiveView with tab switching)
  live "/", HomeLive, :index
  live "/groups", GroupsLive
  # Activity page route (you’ll no longer need this once Activity is a tab)
  # Comment it out for now so it doesn't interfere:
  # live "/activity", ActivityLive, :index

  # Static Pages
  get "/profile", PageController, :profile
  get "/discussions", PageController, :discussions
  #get "/groups", PageController, :groups
  get "/groups2", PageController, :groups2
  get "/subgroup_topics", PageController, :subgroup_topics
  get "/subgroup_topics2", PageController, :subgroup_topics2
  get "/group_building_skale", PageController, :group_building_skale
  get "/subgroup_building_culture", PageController, :subgroup_building_culture
end


  # Other scopes may use custom stacks.
  # scope "/api", SkalePrototypeWeb do
  #   pipe_through :api
  # end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:skale_prototype, :dev_routes) do
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: SkalePrototypeWeb.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
