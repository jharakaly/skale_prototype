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

    get "/", PageController, :home
    get "/activity", PageController, :activity
    get "/profile", PageController, :profile
    get "/discussions", PageController, :discussions
    get "/groups", PageController, :groups
    get "/groups2", PageController, :groups2
    get "/subgroup_topics", PageController, :subgroup_topics

  end

  # Other scopes may use custom stacks.
  # scope "/api", SkalePrototypeWeb do
  #   pipe_through :api
  # end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:skale_prototype, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: SkalePrototypeWeb.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
