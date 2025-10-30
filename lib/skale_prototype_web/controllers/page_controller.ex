defmodule SkalePrototypeWeb.PageController do
  use SkalePrototypeWeb, :controller

  def home(conn, _params) do
    render(conn, "home.html")
  end

  def activity(conn, _params) do
    render(conn, "activity.html")
  end

  def profile(conn, _params) do
    render(conn, "profile.html")
  end

  def discussions(conn, _params) do
    render(conn, "discussions.html")
  end

  def groups(conn, _params) do
    render(conn, "groups.html")
  end

  def groups2(conn, _params) do
    render(conn, "groups2.html")
  end

  def subgroup_topics(conn, _params) do
    render(conn, "subgroup_topics.html")
  end

end
