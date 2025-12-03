defmodule SkalePrototypeWeb.PageController do
  use SkalePrototypeWeb, :controller

  # REMOVED: home/2 — now handled by LiveView
  # def home(conn, _params) do
  #   render(conn, "home.html")
  # end

  # REMOVED: activity/2 — now handled by LiveView
  # def activity(conn, _params) do
  #   render(conn, "activity.html")
  # end

  def profile(conn, _params) do
    render(conn, "profile.html")
  end

  def discussions(conn, _params) do
    render(conn, "discussions.html")
  end

 # def groups(conn, _params) do
 #   render(conn, "groups.html")
 # end

  def groups2(conn, _params) do
    render(conn, "groups2.html")
  end

  def subgroup_topics(conn, _params) do
    render(conn, "subgroup_topics.html")
  end

  def subgroup_topics2(conn, _params) do
    render(conn, "subgroup_topics2.html")
  end

  def group_building_skale(conn, _params) do
    render(conn, "group_building_skale.html")
  end


   def subgroup_building_culture(conn, _params) do
    render(conn, "subgroup_building_culture.html")
  end

end
