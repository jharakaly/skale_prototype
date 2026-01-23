defmodule SkalePrototypeWeb.MockData do
  # ======================================================
  # SECTION 1 — Topic replies (detailed single topic)
  # ======================================================
  def get_topic_replies do
    %{
      id: 1,
      title: "My perfect vegan chocolate cake recipe! 🎂",
      excerpt: "After months of experimenting, I finally perfected this moist vegan chocolate cake that everyone loves...",
      content: """
      After months of experimenting, I finally perfected this moist vegan chocolate cake that everyone loves - even non-vegans can't tell the difference!

      This recipe uses simple pantry ingredients and is surprisingly easy to make. The secret is using apple cider vinegar with baking soda for the perfect rise, and a combination of oil and applesauce for incredible moisture.

      **Ingredients:**
      - 2 cups all-purpose flour
      - 1 3/4 cups granulated sugar
      - 3/4 cup unsweetened cocoa powder
      - 2 teaspoons baking soda
      - 1 teaspoon baking powder
      - 1 teaspoon salt
      - 1 cup unsweetened almond milk
      - 1/2 cup vegetable oil
      - 2 teaspoons vanilla extract
      - 1 cup hot water

      **Instructions:**
      1. Preheat oven to 350°F (175°C). Grease and flour two 9-inch round cake pans.
      2. In a large bowl, whisk together dry ingredients.
      3. Add almond milk, oil, and vanilla. Mix until just combined.
      4. Carefully stir in hot water (batter will be thin).
      5. Pour into prepared pans and bake for 30-35 minutes.
      6. Let cool completely before frosting.

      The hot water helps bloom the cocoa for a deeper chocolate flavor! Let me know if you want my go-to vegan chocolate ganache recipe too 😊
      """,
      reply_count: 24,
      time_ago: "3 hours ago",
      avatars: ["SJ", "MB", "AK"],
      additional_count: 5,
      media: [
        %{
          type: "image",
          url:
            "https://images.unsplash.com/photo-1578985545062-69928b1d9587?auto=format&fit=crop&w=1200&q=80"
        }
      ],
      replies: [
        %{
          id: 1,
          author: "Mark Brown",
          avatar: "https://i.pravatar.cc/150?img=1",
          content:
            "This looks amazing! I've been searching for a good vegan chocolate cake recipe. Have you tried using espresso powder to enhance the chocolate flavor? ☕🍫",
          time_ago: "2 hours ago",
          likes: 15,
          replies: [
            %{
              id: 11,
              author: "Sarah Johnson",
              avatar: "https://i.pravatar.cc/150?img=2",
              content:
                "Yes! I sometimes add 1 tsp of instant espresso powder and it really deepens the flavor without tasting like coffee.",
              time_ago: "1 hour ago",
              likes: 8,
              replies: []
            }
          ]
        },
        %{
          id: 2,
          author: "Emily Davis",
          avatar: "https://i.pravatar.cc/150?img=3",
          content:
            "Can I substitute coconut sugar for the granulated sugar? I'm trying to cut down on refined sugar.",
          time_ago: "1 hour ago",
          likes: 9,
          replies: [
            %{
              id: 21,
              author: "Sarah Johnson",
              avatar: "https://i.pravatar.cc/150?img=2",
              content:
                "You can, but the texture might be slightly more dense. I'd start with 1 1/2 cups coconut sugar instead of 1 3/4 cups regular sugar.",
              time_ago: "55 min ago",
              likes: 12,
              replies: []
            }
          ]
        },
        %{
          id: 3,
          author: "Alex Kim",
          avatar: "https://i.pravatar.cc/150?img=4",
          content:
            "I tried this with gluten-free flour and it still turned out great! Just needed a few extra minutes in the oven.",
          time_ago: "30 min ago",
          likes: 8,
          replies: []
        },
        %{
          id: 4,
          author: "Priya Patel",
          avatar: "https://i.pravatar.cc/150?img=5",
          content:
            "Adding a bit of orange zest to the batter makes this taste like a fancy patisserie dessert 🍊",
          time_ago: "10 min ago",
          likes: 9,
          replies: []
        }
      ]
    }
  end

  # ======================================================
  # SECTION 2 — All topics (for matching activity to topic)
  # ======================================================
  def get_all_topics do
    [
      %{
        id: 1,
        title: "My perfect vegan chocolate cake recipe! 🎂",
        excerpt: "After months of experimenting, I finally perfected this moist vegan chocolate cake that everyone loves...",
        content: """
        After months of experimenting, I finally perfected this moist vegan chocolate cake that everyone loves - even non-vegans can't tell the difference!

        This recipe uses simple pantry ingredients and is surprisingly easy to make. The secret is using apple cider vinegar with baking soda for the perfect rise, and a combination of oil and applesauce for incredible moisture.

        **Ingredients:**
        - 2 cups all-purpose flour
        - 1 3/4 cups granulated sugar
        - 3/4 cup unsweetened cocoa powder
        - 2 teaspoons baking soda
        - 1 teaspoon baking powder
        - 1 teaspoon salt
        - 1 cup unsweetened almond milk
        - 1/2 cup vegetable oil
        - 2 teaspoons vanilla extract
        - 1 cup hot water

        **Instructions:**
        1. Preheat oven to 350°F (175°C). Grease and flour two 9-inch round cake pans.
        2. In a large bowl, whisk together dry ingredients.
        3. Add almond milk, oil, and vanilla. Mix until just combined.
        4. Carefully stir in hot water (batter will be thin).
        5. Pour into prepared pans and bake for 30-35 minutes.
        6. Let cool completely before frosting.

        The hot water helps bloom the cocoa for a deeper chocolate flavor! Let me know if you want my go-to vegan chocolate ganache recipe too 😊
        """,
        reply_count: 24,
        time_ago: "3 hours ago",
        avatars: ["SJ", "MB", "AK"],
        additional_count: 5,
        media: [
          %{
            type: "image",
            url:
              "https://images.unsplash.com/photo-1578985545062-69928b1d9587?auto=format&fit=crop&w=1200&q=80"
          }
        ]
      },
      %{
        id: 2,
        title: "Essential pantry items for new vegans",
        excerpt: "What are the must-have ingredients to stock your kitchen when starting a vegan diet?",
        content: """
        When you're new to vegan cooking, having the right staples in your pantry makes everything easier.

        **My essentials:**
        - Nutritional yeast (for cheesy flavor)
        - Chickpeas & black beans
        - Lentils (red and green)
        - Coconut milk
        - Oats
        - Flax seeds & chia seeds
        - Soy sauce / tamari
        - Vegetable broth
        - Frozen veggies
        """,
        reply_count: 31,
        time_ago: "5 hours ago",
        avatars: ["L", "K"],
        additional_count: 29
      },
      %{
        id: 7,
        title: "Nutrition concerns for new vegans",
        excerpt:
          "What nutrients should beginners pay attention to?",
        content:
          "What nutrients should beginners pay attention to?",
        reply_count: 18,
        time_ago: "2 days ago",
        avatars: ["P", "D", "N"],
        additional_count: 15
      },
      %{
        id: 8,
        title: "Budget-friendly vegan meal prep ideas",
        excerpt:
          "How do you keep your grocery bill low while eating a healthy vegan diet?",
        content:
          "How do you keep your grocery bill low while eating a healthy vegan diet?",
        reply_count: 15,
        time_ago: "3 days ago",
        avatars: ["G", "S"],
        additional_count: 10
      },
      %{
        id: 3,
        title: "Beautiful vegan pastry collection from my bakery",
        excerpt:
          "Sharing some photos from this week's bake. Everything is 100% plant-based and delicious...",
        content:
          "Sharing some photos from this week's bake. Everything is 100% plant-based...",
        reply_count: 42,
        time_ago: "2 days ago",
        avatars: ["BD", "LC", "MP", "KW"],
        additional_count: 8,
        media: [
          %{
            type: "image",
            url:
              "https://images.unsplash.com/photo-1517248135467-4c7edcad34c4?auto=format&fit=crop&w=1200&q=80"
          },
          %{
            type: "video",
            url: "https://www.youtube.com/embed/2Bj4A2S1p_8"
          }
        ]
      },
      %{
        id: 4,
        title: "Tips for transitioning to a vegan lifestyle gradually",
        excerpt:
          "For those who switched over time, what worked best for you?",
        content:
          "For those who switched over time, what worked best for you?",
        reply_count: 21,
        time_ago: "1 week ago",
        avatars: ["HJ", "RM"],
        additional_count: 12
      }
    ]
  end

  # ======================================================
  # SECTION 3 — Recent activities for activity feed
  # ======================================================
  def get_recent_activities do
    [
      # --- Nested reply (only one chocolate cake activity now) ---
      %{
        id: 2,
        type: :reply,
        user_name: "Mark Brown",
        user_avatar: "https://i.pravatar.cc/150?img=3",
        group_name: "Vegan recipe tips",
        subgroup: "Vegan baking",
        reply_to: "Priya Patel",
        parent_excerpt: "Adding a bit of orange zest makes this taste like a fancy patisserie dessert 🍊",
        reply_excerpt: "Totally agree! I tried it with blood orange and it was next-level.",
        target_content: "in the thread on 'My perfect vegan chocolate cake recipe! 🎂'",
        target_link: "/topic/1#reply-4",
        time_ago: "12 min ago",
        reply_context: :nested
      },

      # --- Like on topic ---
      %{
        id: 3,
        type: :like,
        user_name: "Alex Kim",
        user_avatar: "https://i.pravatar.cc/150?img=4",
        group_name: "Vegan recipe tips",
        subgroup: "Vegan baking",
        topic_id: 1,
        topic_title: "My perfect vegan chocolate cake recipe! 🎂",
        target_content: "liked your recipe post",
        target_link: "/topic/1",
        time_ago: "20 min ago"
      },

      # --- Like on reply ---
      %{
        id: 4,
        type: :reply_liked,
        user_name: "Emily Davis",
        user_avatar: "https://i.pravatar.cc/150?img=5",
        group_name: "Vegan recipe tips",
        subgroup: "Vegan baking",
        topic_id: 1,
        topic_title: "My perfect vegan chocolate cake recipe! 🎂",
        target_content: "liked your comment about espresso powder",
        target_link: "/topic/1#reply-2",
        time_ago: "25 min ago"
      },

      # --- Mention (notification style) ---
      %{
        id: 5,
        type: :mention,
        user_name: "Priya Patel",
        user_avatar: "https://i.pravatar.cc/150?img=6",
        group_name: "Vegan recipe tips",
        subgroup: "Beginner vegan",
        topic_id: 2,
        topic_title: "Essential pantry items for new vegans",
        mentioned_content: "@james.hara do you have a list of starter recipes for new vegans?",
        target_content: "mentioned you in the pantry starter thread",
        target_link: "/topic/2#reply-3",
        time_ago: "40 min ago"
      },

      # --- New follower (notification style) ---
      %{
        id: 6,
        type: :follow,
        user_name: "New Community Member",
        user_avatar: "https://i.pravatar.cc/150?img=7",
        group_name: "Vegan recipe tips",
        subgroup: "Beginner vegan",
        target_content: "started following your activity",
        target_link: "/users/new-member",
        time_ago: "1 hour ago"
      },

      # --- Topic created ---
      %{
        id: 7,
        type: :topic_created,
        user_name: "Christina",
        user_avatar: "https://i.pravatar.cc/150?img=16",
        group_name: "Vegan recipe tips",
        subgroup: "Vegan baking",
        topic_id: 3,
        topic_title: "Beautiful vegan pastry collection from my bakery",
        title: "Beautiful vegan pastry collection from my bakery",
        breadcrumb: ["Vegan recipe tips", "Vegan baking"],
        target_content: "posted a new photo-heavy topic in Vegan baking",
        target_link: "/topic/3",
        time_ago: "3 hours ago"
      },

      # --- Topic liked (semantic) ---
      %{
        id: 8,
        type: :topic_liked,
        user_name: "Taylor Swift",
        user_avatar: "https://i.pravatar.cc/150?img=10",
        group_name: "Vegan recipe tips",
        subgroup: "Vegan baking",
        topic_id: 3,
        topic_title: "Beautiful vegan pastry collection from my bakery",
        breadcrumb: ["Vegan recipe tips", "Vegan baking"],
        target_content: "liked your vegan pastry gallery topic",
        target_link: "/topic/3",
        time_ago: "3 hours ago"
      },

      # --- Reply liked (semantic, second example) ---
      %{
        id: 9,
        type: :reply_liked,
        user_name: "Alex Kim",
        user_avatar: "https://i.pravatar.cc/150?img=4",
        group_name: "Vegan recipe tips",
        subgroup: "Vegan baking",
        topic_id: 1,
        topic_title: "My perfect vegan chocolate cake recipe! 🎂",
        breadcrumb: ["Vegan recipe tips", "Vegan baking"],
        target_content: "liked your tip about espresso powder in the comments",
        target_link: "/topic/1#reply-2",
        time_ago: "4 hours ago"
      },

      # --- Subgroup / project created ---
      %{
        id: 10,
        type: :subgroup_created,
        user_name: "James Harakaly",
        user_avatar: "https://i.pravatar.cc/150?img=8",
        group_name: "Building Skale",
        subgroup: "Community culture",
        breadcrumb: ["Building Skale", "Community culture"],
        project_name: "Creating a forum platform",
        target_content: "created the project space \"Creating a forum platform\"",
        target_link: "/projects/forum-platform",
        time_ago: "6 hours ago"
      },

      # --- Project joined ---
      %{
        id: 11,
        type: :project_joined,
        user_name: "Taylor Swift",
        user_avatar: "https://i.pravatar.cc/150?img=10",
        group_name: "Building Skale",
        subgroup: "Community culture",
        breadcrumb: ["Building Skale", "Community culture"],
        project_name: "Creating a forum platform",
        target_content: "joined the project team for \"Creating a forum platform\"",
        target_link: "/projects/forum-platform",
        time_ago: "7 hours ago"
      },

      # --- Project left ---
      %{
        id: 12,
        type: :project_left,
        user_name: "Alex Kim",
        user_avatar: "https://i.pravatar.cc/150?img=4",
        group_name: "Building Skale",
        subgroup: "Community culture",
        breadcrumb: ["Building Skale", "Community culture"],
        project_name: "Creating a forum platform",
        target_content: "left the project \"Creating a forum platform\"",
        target_link: "/projects/forum-platform",
        time_ago: "9 hours ago"
      },

      # --- Invite sent ---
      %{
        id: 13,
        type: :invite_sent,
        user_name: "James Harakaly",
        user_avatar: "https://i.pravatar.cc/150?img=8",
        group_name: "Building Skale",
        subgroup: "Community culture",
        breadcrumb: ["Building Skale", "Community culture"],
        project_name: "Creating a forum platform",
        target_content: "sent out new invitations to join \"Creating a forum platform\"",
        target_link: "/projects/forum-platform",
        time_ago: "10 hours ago"
      },

      # --- Invite accepted ---
      %{
        id: 14,
        type: :invite_accepted,
        user_name: "Priya Patel",
        user_avatar: "https://i.pravatar.cc/150?img=14",
        group_name: "Building Skale",
        subgroup: "Community culture",
        breadcrumb: ["Building Skale", "Community culture"],
        project_name: "Creating a forum platform",
        target_content: "accepted your invitation and joined \"Creating a forum platform\"",
        target_link: "/projects/forum-platform",
        time_ago: "11 hours ago"
      },

      # --- Task created ---
      %{
        id: 15,
        type: :task_created,
        user_name: "James Harakaly",
        user_avatar: "https://i.pravatar.cc/150?img=8",
        group_name: "Building Skale",
        subgroup: "Community culture",
        breadcrumb: ["Building Skale", "Community culture"],
        project_name: "Creating a forum platform",
        title: "Design homepage activity feed",
        due_date: "Friday",
        target_content: "created the task \"Design homepage activity feed\" in the project",
        target_link: "/projects/forum-platform/tasks/1",
        time_ago: "11 hours ago"
      },

      # --- Task assigned ---
      %{
        id: 16,
        type: :task_assigned,
        user_name: "James Harakaly",
        user_avatar: "https://i.pravatar.cc/150?img=8",
        group_name: "Building Skale",
        subgroup: "Community culture",
        breadcrumb: ["Building Skale", "Community culture"],
        project_name: "Creating a forum platform",
        title: "Design homepage activity feed",
        due_date: "Friday",
        target_content: "assigned you to the task \"Design homepage activity feed\"",
        target_link: "/projects/forum-platform/tasks/1",
        time_ago: "12 hours ago"
      },

      # --- Task completed ---
      %{
        id: 17,
        type: :task_completed,
        user_name: "Christina",
        user_avatar: "https://i.pravatar.cc/150?img=16",
        group_name: "Building Skale",
        subgroup: "Community culture",
        breadcrumb: ["Building Skale", "Community culture"],
        project_name: "Creating a forum platform",
        title: "Finalize MVP for activity feed",
        target_content: "marked the task \"Finalize MVP for activity feed\" as complete",
        target_link: "/projects/forum-platform/tasks/2",
        time_ago: "1 day ago"
      },

      # --- File uploaded ---
      %{
        id: 18,
        type: :file_uploaded,
        user_name: "Taylor Swift",
        user_avatar: "https://i.pravatar.cc/150?img=10",
        group_name: "Building Skale",
        subgroup: "Community culture",
        breadcrumb: ["Building Skale", "Community culture"],
        project_name: "Creating a forum platform",
        file_name: "activity-feed-wireframe-v2.png",
        target_content: "uploaded a new wireframe for the homepage activity feed",
        target_link: "/projects/forum-platform/files/1",
        time_ago: "1 day ago"
      },

      # --- Topic edited ---
      %{
        id: 19,
        type: :topic_edited,
        user_name: "Sarah Johnson",
        user_avatar: "https://i.pravatar.cc/150?img=2",
        group_name: "Vegan recipe tips",
        subgroup: "Vegan baking",
        breadcrumb: ["Vegan recipe tips", "Vegan baking"],
        topic_id: 1,
        topic_title: "My perfect vegan chocolate cake recipe! 🎂",
        target_content: "updated details in your vegan chocolate cake recipe post",
        target_link: "/topic/1",
        time_ago: "2 days ago"
      },

      # --- Topic deleted ---
      %{
        id: 20,
        type: :topic_deleted,
        user_name: "System",
        user_avatar: "https://i.pravatar.cc/150?img=22",
        group_name: "Vegan recipe tips",
        subgroup: "Beginner vegan",
        topic_title: "Off-topic promotion post",
        target_content: "removed an off-topic or promotional thread from Beginner vegan",
        target_link: "#",
        time_ago: "2 days ago"
      },

      # --- Topic pinned ---
      %{
        id: 21,
        type: :topic_pinned,
        user_name: "James Harakaly",
        user_avatar: "https://i.pravatar.cc/150?img=8",
        group_name: "Building Skale",
        subgroup: "Community culture",
        breadcrumb: ["Building Skale", "Community culture"],
        topic_title: "Creating a forum platform — overview",
        target_content: "pinned the overview topic for the project",
        target_link: "/projects/forum-platform/topic/overview",
        time_ago: "3 days ago"
      },

      # --- Topic unpinned ---
      %{
        id: 22,
        type: :topic_unpinned,
        user_name: "James Harakaly",
        user_avatar: "https://i.pravatar.cc/150?img=8",
        group_name: "Building Skale",
        subgroup: "Community culture",
        breadcrumb: ["Building Skale", "Community culture"],
        topic_title: "Old announcement post",
        target_content: "unpinned an older announcement to make room for new updates",
        target_link: "/projects/forum-platform/topic/old-announcement",
        time_ago: "4 days ago"
      },

      # --- Followed (project/topic followed) ---
      %{
        id: 23,
        type: :followed,
        user_name: "Alex Kim",
        user_avatar: "https://i.pravatar.cc/150?img=4",
        group_name: "Building Skale",
        subgroup: "Community culture",
        breadcrumb: ["Building Skale", "Community culture"],
        topic_title: "Creating a forum platform",
        target_content: "started following updates for \"Creating a forum platform\"",
        target_link: "/projects/forum-platform",
        time_ago: "5 days ago"
      },

      # --- Unfollowed ---
      %{
        id: 24,
        type: :unfollowed,
        user_name: "Emily Davis",
        user_avatar: "https://i.pravatar.cc/150?img=5",
        group_name: "Building Skale",
        subgroup: "Community culture",
        breadcrumb: ["Building Skale", "Community culture"],
        topic_title: "Creating a forum platform",
        target_content: "unfollowed updates for \"Creating a forum platform\"",
        target_link: "/projects/forum-platform",
        time_ago: "6 days ago"
      },

      # --- Shared externally ---
      %{
        id: 25,
        type: :shared_externally,
        user_name: "Taylor Swift",
        user_avatar: "https://i.pravatar.cc/150?img=10",
        group_name: "Building Skale",
        subgroup: "Community culture",
        project_name: "Creating a forum platform",
        network: "LinkedIn",
        target_content: "shared the latest project update to LinkedIn",
        target_link: "https://linkedin.com",
        time_ago: "1 week ago"
      },

      # --- Poll started ---
      %{
        id: 26,
        type: :poll_started,
        user_name: "James Harakaly",
        user_avatar: "https://i.pravatar.cc/150?img=8",
        group_name: "Building Skale",
        subgroup: "Community culture",
        breadcrumb: ["Building Skale", "Community culture"],
        topic_title: "Which feature should we build next?",
        target_content: "started a feature-priority poll for the project",
        target_link: "/projects/forum-platform/polls/1",
        time_ago: "1 week ago"
      },

      # --- Poll voted ---
      %{
        id: 27,
        type: :poll_voted,
        user_name: "Priya Patel",
        user_avatar: "https://i.pravatar.cc/150?img=14",
        group_name: "Building Skale",
        subgroup: "Community culture",
        topic_title: "Which feature should we build next?",
        target_content: "cast a vote in the feature-priority poll",
        target_link: "/projects/forum-platform/polls/1",
        time_ago: "1 week ago"
      },

      # --- Tag added ---
      %{
        id: 28,
        type: :tag_added,
        user_name: "James Harakaly",
        user_avatar: "https://i.pravatar.cc/150?img=8",
        group_name: "Building Skale",
        subgroup: "Community culture",
        tag: "MVP",
        target_content: "added the tag \"MVP\" to the forum platform project",
        target_link: "/projects/forum-platform",
        time_ago: "1 week ago"
      },

      # --- Tag removed ---
      %{
        id: 29,
        type: :tag_removed,
        user_name: "James Harakaly",
        user_avatar: "https://i.pravatar.cc/150?img=8",
        group_name: "Building Skale",
        subgroup: "Community culture",
        tag: "Draft",
        target_content: "removed the tag \"Draft\" from the project",
        target_link: "/projects/forum-platform",
        time_ago: "1 week ago"
      },

      # --- Milestone reached ---
      %{
        id: 30,
        type: :milestone_reached,
        user_name: "System",
        user_avatar: "https://i.pravatar.cc/150?img=22",
        group_name: "Building Skale",
        subgroup: "Community culture",
        title: "Reached 100 active members in Creating a forum platform",
        target_content: "project milestone reached: 100 active members",
        target_link: "/projects/forum-platform/milestones/1",
        time_ago: "2 weeks ago"
      },

      # --- File commented ---
      %{
        id: 31,
        type: :file_commented,
        user_name: "Alex Kim",
        user_avatar: "https://i.pravatar.cc/150?img=4",
        group_name: "Building Skale",
        subgroup: "Community culture",
        file_name: "activity-feed-wireframe-v2.png",
        target_content: "left feedback on your activity feed wireframe",
        target_link: "/projects/forum-platform/files/1",
        time_ago: "2 weeks ago"
      },

      # --- Task mentioned ---
      %{
        id: 32,
        type: :task_mentioned,
        user_name: "Taylor Swift",
        user_avatar: "https://i.pravatar.cc/150?img=10",
        group_name: "Building Skale",
        subgroup: "Community culture",
        title: "Review onboarding copy",
        target_content: "mentioned you in the task \"Review onboarding copy\"",
        target_link: "/projects/forum-platform/tasks/3",
        time_ago: "2 weeks ago"
      },

      # --- Due date changed ---
      %{
        id: 33,
        type: :due_date_changed,
        user_name: "James Harakaly",
        user_avatar: "https://i.pravatar.cc/150?img=8",
        group_name: "Building Skale",
        subgroup: "Community culture",
        title: "Design homepage activity feed",
        due_date: "next Wednesday",
        target_content: "moved the deadline for \"Design homepage activity feed\"",
        target_link: "/projects/forum-platform/tasks/1",
        time_ago: "2 weeks ago"
      },

      # --- Emoji reaction ---
      %{
        id: 34,
        type: :emoji_reaction,
        user_name: "Priya Patel",
        user_avatar: "https://i.pravatar.cc/150?img=14",
        group_name: "Vegan recipe tips",
        subgroup: "Vegan baking",
        emoji: "🎉",
        topic_title: "My perfect vegan chocolate cake recipe! 🎂",
        target_content: "reacted 🎉 to your chocolate cake recipe post",
        target_link: "/topic/1",
        time_ago: "1 week ago"
      },

      # --- Project archived ---
      %{
        id: 35,
        type: :project_archived,
        user_name: "System",
        user_avatar: "https://i.pravatar.cc/150?img=22",
        group_name: "Building Skale",
        subgroup: "Community culture",
        project_name: "Creating a forum platform",
        target_content: "archived an older experimental project related to the forum work",
        target_link: "/projects/old-experiment",
        time_ago: "3 weeks ago"
      },

      # --- Project closed ---
      %{
        id: 36,
        type: :project_closed,
        user_name: "System",
        user_avatar: "https://i.pravatar.cc/150?img=22",
        group_name: "Building Skale",
        subgroup: "Community culture",
        project_name: "Creating a forum platform",
        target_content: "closed the pilot phase of \"Creating a forum platform\"",
        target_link: "/projects/forum-platform",
        time_ago: "3 weeks ago"
      }
    ]
  end

  # ======================================================
  # SECTION 4 — Community Culture subgroup (topics + replies)
  # ======================================================

  # Detailed main Community Culture topic + nested replies
  def get_culture_topic do
    %{
      id: 1,
      group_name: "Building Skale",
      subgroup: "Community culture",
      title: "What behaviors make Skale feel welcoming?",
      excerpt:
        "When you think about the best moments you've had in an online community, there is usually a very specific behavior behind it: someone took a little extra time to explain something, noticed you were new, or framed feedback in a way that felt generous instead of harsh.",
      content: """
      When you think about the best moments you've had in an online community, there is usually
      a very specific behavior behind it: someone took a little extra time to explain something,
      noticed you were new, or framed feedback in a way that felt generous instead of harsh.

      This thread is where we name those behaviors for Skale.

      **Some prompts to get us started:**
      - What was a small thing someone did here (or in another community) that made you feel welcome?
      - When a thread gets tense, what have you seen people do that actually *lowered* the temperature?
      - How do you like people to respond when you share work-in-progress or a vulnerable story?

      The more concrete we get, the easier it will be to turn “good vibes” into clear, repeatable
      behaviors that we can design into onboarding, prompts, and even product features.
      """,
      reply_count: 14,
      time_ago: "2 hours ago",
      avatars: ["SC", "MJ", "JR"],
      additional_count: 3,
      replies: [
        %{
          id: 1,
          author: "Sarah Chen",
          initials: "SC",
          avatar: "https://i.pravatar.cc/150?img=12",
          time_ago: "1 hour ago",
          likes: 12,
          content: """
          One behavior that instantly makes a space feel safer for me is when people **reflect back what they heard**
          before they respond. Even something as simple as:

          > “If I'm hearing you right, you're saying X. Did I get that?”

          That tiny pause changes the energy. It tells me you’re not just waiting to talk — you’re actually
          trying to understand. I’d love for this to be a norm on Skale, especially in feedback or critique threads.
          """,
          replies: [
            %{
              id: 11,
              author: "Community Culture Team",
              initials: "CC",
              avatar: "https://i.pravatar.cc/150?img=20",
              time_ago: "45 min ago",
              likes: 7,
              content: """
              Love this. From a culture-design perspective, this is also something we can coach in system prompts
              (e.g., “Try restating what you heard before you disagree.”). It’s a behavior we can *teach*,
              not just hope people magically figure out.
              """,
              replies: []
            }
          ]
        },
        %{
          id: 2,
          author: "Maria Johnson",
          initials: "MJ",
          avatar: "https://i.pravatar.cc/150?img=15",
          time_ago: "45 min ago",
          likes: 10,
          content: """
          A small thing that matters a *lot*: **tagging new members by name** when they show up.

          When someone posts for the first time and gets a “Hey @name, welcome — here’s a good place to start,”
          it feels like they walked into a room where people were actually expecting them.

          I’d love to see:
          - A visible “first post” indicator so we know to give extra care.
          - A loose norm that *at least one person* responds to every first post within 24 hours.
          """,
          replies: [
            %{
              id: 21,
              author: "Jordan Reyes",
              initials: "JR",
              avatar: "https://i.pravatar.cc/150?img=9",
              time_ago: "30 min ago",
              likes: 5,
              content: """
              +1 to this. Silence on a first post can feel like rejection, even if everyone is just busy.
              I think “no first posts left unanswered” should be one of our core culture commitments.
              """,
              replies: []
            }
          ]
        },
        %{
          id: 3,
          author: "Tom Kim",
          initials: "TK",
          avatar: "https://i.pravatar.cc/150?img=13",
          time_ago: "30 min ago",
          likes: 8,
          content: """
          I’d love to normalize a **“Pause + Reframe”** move for heated threads.

          Something like:
          1. A moderator (or any trusted member) can pause new replies for a short window.
          2. They write a neutral summary of what’s been said so far.
          3. They reopen the thread with a clearer prompt like: “Let’s focus on X for the next few replies.”

          This makes conflict feel guided instead of chaotic, and it gives people a chance to re-engage
          without feeling like they’re walking into a fight.
          """,
          replies: []
        },
        %{
          id: 4,
          author: "Aisha Bello",
          initials: "AB",
          avatar: "https://i.pravatar.cc/150?img=18",
          time_ago: "10 min ago",
          likes: 6,
          content: """
          For me, “welcoming” also shows up in **how we recognize contributions**.

          When shout-outs and praise only go to a small visible group, it starts to feel cliquey.
          I’d love to see:
          - Rotating “community highlights” where members nominate each other.
          - Occasional spotlight posts on quieter contributors whose work mostly happens behind the scenes.
          - Language that credits *behaviors* (“asked great questions”, “gave kind feedback”), not just outcomes.
          """,
          replies: []
        }
      ]
    }
  end

  # List of Community Culture topics (for topic cards / feeds)
  def get_culture_topics do
    [
      %{
        id: 1,
        group_name: "Building Skale",
        subgroup: "Community culture",
        title: "What behaviors make Skale feel welcoming?",
        excerpt:
          "When you think about the best moments you've had in an online community, there is usually a very specific behavior behind it: someone took a little extra time to explain something, noticed you were new, or framed feedback in a way that felt generous instead of harsh.",
        content: """
        When you think about the best moments you've had in an online community, there is usually
        a very specific behavior behind it: someone took a little extra time to explain something,
        noticed you were new, or framed feedback in a way that felt generous instead of harsh.

        This thread is where we name those behaviors for Skale.

        **Some prompts to get us started:**
        - What was a small thing someone did here (or in another community) that made you feel welcome?
        - When a thread gets tense, what have you seen people do that actually *lowered* the temperature?
        - How do you like people to respond when you share work-in-progress or a vulnerable story?

        The more concrete we get, the easier it will be to turn “good vibes” into clear, repeatable
        behaviors that we can design into onboarding, prompts, and even product features.
        """,
        reply_count: 14,
        time_ago: "2 hours ago",
        avatars: ["SC", "MJ"],
        additional_count: 0
      },
      %{
        id: 2,
        group_name: "Building Skale",
        subgroup: "Community culture",
        title: "Handling conflict and disagreement respectfully",
        excerpt:
          "How do we keep tough conversations constructive and kind when stakes are high and opinions are strong?",
        content: """
        Conflict is inevitable in any creative community. This topic collects playbooks, phrases,
        and norms that help us disagree without turning conversations into fights. Share scripts
        you use to de-escalate, expectations for moderators, and examples of “healthy conflict”
        from other spaces you’ve been part of.
        """,
        reply_count: 9,
        time_ago: "1 day ago",
        avatars: ["TK"],
        additional_count: 0
      },
      %{
        id: 3,
        group_name: "Building Skale",
        subgroup: "Community culture",
        title: "Recognizing contributions without creating cliques",
        excerpt:
          "Design recognition systems that celebrate great work and kindness, while still making it easy for new voices to join.",
        content: """
        We want Skale to be a place where contributions are visible and appreciated, without making
        newer or quieter members feel like they’re on the outside looking in. This topic gathers
        ideas for shout-outs, badges, rituals, and lightweight systems that keep recognition flowing
        in an inclusive way.
        """,
        reply_count: 6,
        time_ago: "3 days ago",
        avatars: ["AB"],
        additional_count: 0
      },
      %{
        id: 4,
        group_name: "Building Skale",
        subgroup: "Community culture",
        title: "Supporting new members in their first week",
        excerpt:
          "What should every new member experience in their first days so they feel welcomed, oriented, and excited to contribute?",
        content: """
        First impressions matter. This topic is about designing the “first week on Skale” experience:
        welcome rituals, starter threads, gentle nudges, and norms for how we respond when someone
        posts for the first time. What would make *you* think: “Wow, this community really cares how I show up here”?
        """,
        reply_count: 11,
        time_ago: "5 days ago",
        avatars: ["JR"],
        additional_count: 0
      }
    ]
  end
end
