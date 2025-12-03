defmodule SkalePrototypeWeb.Components.Groups do
  # Change from :components to :live_component to match homepage.ex structure
  use SkalePrototypeWeb, :live_component

  alias SkalePrototypeWeb.Components.RightSidebar

  def render(assigns) do
    ~H"""
    <div class="container mx-auto px-4">
      <div class="main-content">
        <div class="left-column">
          <!-- Breadcrumb only in left column -->
          <div class="breadcrumb">
            <div class="breadcrumb-item">
              <a href="/" class="breadcrumb-link">Home</a>
            </div>
            <span class="breadcrumb-separator">/</span>
            <div class="breadcrumb-item">
              <a href="/discussions" class="breadcrumb-link">Discussions</a>
            </div>
            <span class="breadcrumb-separator">/</span>
            <div class="breadcrumb-item">
              <span class="breadcrumb-active">Vegan Recipe Tips</span>
            </div>
          </div>
          <!-- Group Header Container -->
          <div class="group-header-container" id="groupHeader">
            <div class="group-content">
              <h1 class="group-title">Vegan Recipe Tips</h1>
              <h2 class="group-subtitle">Mastering Plant-Based Cooking</h2>
              <div class="overview-container">
                <div class="group-overview collapsed" id="overviewText">
                  Join our community of passionate vegan cooks sharing innovative recipes,
                  ingredient substitutions, and cooking techniques. Whether you're new to
                  plant-based eating or a seasoned vegan chef, you'll find inspiration and
                  practical advice to elevate your culinary skills. Share your discoveries
                  and learn from others in this supportive environment. Our members range
                  from beginners looking for simple meal ideas to professional chefs
                  exploring advanced techniques. We cover everything from basic ingredient
                  swaps to complex flavor balancing.
                </div>
                <button class="read-more-btn" id="readMoreBtn">Read more...</button>
              </div>
              <div class="moderator-info">
                <div class="moderator-avatar">MJ</div>
                <div class="moderator-details">
                  <div class="moderator-name">Maria Johnson</div>
                  <div class="moderator-role">Group Moderator</div>
                </div>
              </div>
            </div>
            <div class="group-image"></div>
          </div>
          <!-- Subgroups Container -->
          <div class="subgroups-container">
            <h2 class="subgroups-title">Subgroups</h2>
            <div class="subgroups-grid">
              <!-- Subgroup 1 - Linked to Beginner Vegan page -->
              <a href="subgroup_topics" class="subgroup-link">
                <div class="subgroup-card">
                  <div class="subgroup-image"></div>
                  <div class="subgroup-info">
                    <div class="subgroup-name">Beginner Vegan</div>
                    <div class="subgroup-members">245 members</div>
                  </div>
                </div>
              </a>

              <!-- Subgroup 2 Linked to the Vegan Baking subgroup page-->
              <a href="subgroup_topics2" class="subgroup-link">
                <div class="subgroup-card">
                  <div class="subgroup-image"></div>
                  <div class="subgroup-info">
                    <div class="subgroup-name">Vegan Baking</div>
                    <div class="subgroup-members">189 members</div>
                  </div>
                </div>
              </a>

              <!-- Subgroup 3 -->
              <a href="#" class="subgroup-link">
                <div class="subgroup-card">
                  <div class="subgroup-image"></div>
                  <div class="subgroup-info">
                    <div class="subgroup-name">Meal Prep</div>
                    <div class="subgroup-members">312 members</div>
                  </div>
                </div>
              </a>

              <!-- Subgroup 4 -->
              <a href="#" class="subgroup-link">
                <div class="subgroup-card">
                  <div class="subgroup-image"></div>
                  <div class="subgroup-info">
                    <div class="subgroup-name">International Vegan</div>
                    <div class="subgroup-members">278 members</div>
                  </div>
                </div>
              </a>

              <!-- Subgroup 5 -->
              <a href="#" class="subgroup-link">
                <div class="subgroup-card">
                  <div class="subgroup-image"></div>
                  <div class="subgroup-info">
                    <div class="subgroup-name">Quick & Easy</div>
                    <div class="subgroup-members">421 members</div>
                  </div>
                </div>
              </a>

              <!-- Subgroup 6 -->
              <a href="#" class="subgroup-link">
                <div class="subgroup-card">
                  <div class="subgroup-image"></div>
                  <div class="subgroup-info">
                    <div class="subgroup-name">Budget Vegan</div>
                    <div class="subgroup-members">196 members</div>
                  </div>
                </div>
              </a>

              <!-- Subgroup 7 -->
              <a href="#" class="subgroup-link">
                <div class="subgroup-card">
                  <div class="subgroup-image"></div>
                  <div class="subgroup-info">
                    <div class="subgroup-name">Vegan Desserts</div>
                    <div class="subgroup-members">334 members</div>
                  </div>
                </div>
              </a>

              <!-- Subgroup 8 -->
              <a href="#" class="subgroup-link">
                <div class="subgroup-card">
                  <div class="subgroup-image"></div>
                  <div class="subgroup-info">
                    <div class="subgroup-name">Gluten-Free Vegan</div>
                    <div class="subgroup-members">157 members</div>
                  </div>
                </div>
              </a>

              <!-- Subgroup 9 -->
              <a href="#" class="subgroup-link">
                <div class="subgroup-card">
                  <div class="subgroup-image"></div>
                  <div class="subgroup-info">
                    <div class="subgroup-name">Vegan for Athletes</div>
                    <div class="subgroup-members">289 members</div>
                  </div>
                </div>
              </a>
            </div>
          </div>
        </div>

        <!-- Right Sidebar Column -->
        <div class="right-sidebar-column">
          <RightSidebar.right_sidebar />
        </div>
      </div>
    </div>
    """
  end

  # Add this JavaScript in a separate function or in the template
  # Since you have JavaScript in your original, we need to handle it differently
  # Either move it to app.js or use a phx-hook
end
