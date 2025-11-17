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
      - 1 tablespoon apple cider vinegar
      - 1 cup boiling water

      **Instructions:**
      1. Preheat oven to 350°F and grease two 9-inch cake pans
      2. Whisk together dry ingredients in a large bowl
      3. Add milk, oil, vanilla, and vinegar - mix until combined
      4. Carefully stir in boiling water (batter will be thin)
      5. Pour into pans and bake for 30-35 minutes
      6. Let cool completely before frosting

      The boiling water might seem strange, but it helps bloom the cocoa powder for maximum chocolate flavor! Let me know if you try it and what you think!
      """,
      reply_count: 24,
      time_ago: "3 hours ago",
      avatars: ["SJ", "MB", "AK"],
      additional_count: 5,
      media: [
        %{
          type: "image",
          url:
            "https://images.unsplash.com/photo-1578985545062-69928b1d9587?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1089&q=80"
        }
      ],
      replies: [
        %{
          id: 1,
          author: "Sarah Chen",
          avatar: "S",
          time_ago: "3 days ago",
          content:
            "As someone who's been vegan for 5 years, here are my absolute essentials: nutritional yeast (for cheesy flavor), canned coconut milk (for creamy sauces), various beans and lentils, quinoa, and lots of spices!",
          likes: 12,
          replies: []
        },
        %{
          id: 2,
          author: "Mike Rodriguez",
          avatar: "M",
          time_ago: "3 days ago",
          content:
            "Don't forget tahini! It's perfect for dressings, sauces, and even desserts. Also, chickpea flour is amazing for making vegan omelets.",
          likes: 8,
          replies: [
            %{
              id: 21,
              author: "Jamie Lee",
              avatar: "J",
              time_ago: "2 days ago",
              content:
                "Great point about tahini! I use it in my daily salad dressing.",
              likes: 3,
              replies: []
            },
            %{
              id: 22,
              author: "Alex Kim",
              avatar: "A",
              time_ago: "2 days ago",
              content: "Chickpea flour omelet recipe? That sounds amazing!",
              likes: 5,
              replies: [
                %{
                  id: 221,
                  author: "Mike Rodriguez",
                  avatar: "M",
                  time_ago: "1 day ago",
                  content:
                    "Sure! Mix 1 cup chickpea flour with 1 cup water, add turmeric, black salt (for eggy flavor), and your favorite veggies. Cook like a regular omelet!",
                  likes: 7,
                  replies: []
                },
                %{
                  id: 222,
                  author: "Taylor Swift",
                  avatar: "T",
                  time_ago: "1 day ago",
                  content:
                    "Black salt is a game changer! Makes everything taste eggy.",
                  likes: 4,
                  replies: []
                }
              ]
            },
            %{
              id: 23,
              author: "Chris Park",
              avatar: "C",
              time_ago: "1 day ago",
              content: "I second the tahini recommendation. Also great for making quick hummus!",
              likes: 2,
              replies: []
            }
          ]
        },
        %{
          id: 3,
          author: "Dr. Lisa Green",
          avatar: "L",
          time_ago: "2 days ago",
          content:
            "From a nutritional standpoint, make sure you have fortified nutritional yeast for B12, flax seeds for omega-3s, and a variety of whole grains.",
          likes: 15,
          replies: []
        },
        %{
          id: 4,
          author: "Carlos Martinez",
          avatar: "C",
          time_ago: "2 days ago",
          content:
            "Cashews soaked overnight then blended make the best creamy sauces! Also, liquid smoke adds amazing flavor to tofu and tempeh.",
          likes: 9,
          replies: [
            %{
              id: 41,
              author: "Priya Patel",
              avatar: "P",
              time_ago: "1 day ago",
              content: "Yes to liquid smoke! It makes vegan bacon so good.",
              likes: 6,
              replies: []
            }
          ]
        }
      ]
    }
  end
  # ======================================================
  # SECTION 2 — All Topic Cards Feed (13 topics)
  # ======================================================
  def get_all_topics do
    [
      %{
        id: 1,
        title: "My perfect vegan chocolate cake recipe! 🎂",
        excerpt:
          "After months of experimenting, I finally perfected this moist vegan chocolate cake that everyone loves...",
        content:
          "After months of experimenting, I finally perfected this moist vegan chocolate cake that everyone loves...",
        reply_count: 24,
        time_ago: "3 hours ago",
        avatars: ["SJ", "MB", "AK"],
        additional_count: 5,
        media: [
          %{
            type: "image",
            url:
              "https://images.unsplash.com/photo-1578985545062-69928b1d9587?auto=format&fit=crop&w=1089&q=80"
          }
        ]
      },
      %{
        id: 2,
        title: "YouTube tutorial: Vegan sourdough from scratch",
        excerpt:
          "I made a complete guide to vegan sourdough baking. From starter to finished loaf in 5 days...",
        content:
          "A complete guide to vegan sourdough baking from starter to finished loaf...",
        reply_count: 18,
        time_ago: "1 day ago",
        avatars: ["TJ", "RP"],
        additional_count: 3,
        media: [
          %{type: "video", url: "https://www.youtube.com/embed/2Bj4A2S1p_8"}
        ]
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
              "https://images.unsplash.com/photo-1555507036-ab794f27d2e9?auto=format&fit=crop&w=1170&q=80"
          },
          %{
            type: "image",
            url:
              "https://images.unsplash.com/photo-1568254183919-78a4f43a2877?auto=format&fit=crop&w=1169&q=80"
          }
        ]
      },
      %{
        id: 4,
        title: "Essential pantry items for new vegans",
        excerpt:
          "What are the must-have ingredients to stock your kitchen when starting a vegan diet?",
        content:
          "What are the must-have ingredients to stock your kitchen when starting a vegan diet?",
        reply_count: 24,
        time_ago: "3 days ago",
        avatars: ["C", "M", "J", "S"],
        additional_count: 16
      },
      %{
        id: 5,
        title: "Easy vegan breakfast ideas",
        excerpt:
          "Share your quick and delicious vegan breakfast recipes that take less than 10 minutes.",
        content:
          "Share your quick and delicious vegan breakfast recipes...",
        reply_count: 42,
        time_ago: "1 day ago",
        avatars: ["A", "T", "R"],
        additional_count: 39
      },
      %{
        id: 6,
        title: "Dealing with cravings for cheese",
        excerpt:
          "How do you handle cravings for dairy, especially cheese? Any good alternatives?",
        content:
          "How do you handle cravings for dairy products, especially cheese?",
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
        title: "Budget-friendly vegan meals",
        excerpt:
          "Share your most affordable vegan recipes...",
        content:
          "Share your most affordable vegan recipes...",
        reply_count: 27,
        time_ago: "4 days ago",
        avatars: ["E", "F", "G", "H"],
        additional_count: 23
      },
      %{
        id: 9,
        title: "Eating out as a new vegan",
        excerpt:
          "Tips for navigating restaurants and social situations as a new vegan.",
        content:
          "Tips for navigating restaurants and social situations as a new vegan.",
        reply_count: 15,
        time_ago: "1 week ago",
        avatars: ["I", "J"],
        additional_count: 13
      },
      %{
        id: 10,
        title: "Vegan protein sources beyond tofu",
        excerpt:
          "Creative and delicious ways to get enough plant protein.",
        content:
          "Creative and delicious ways to get enough plant protein.",
        reply_count: 33,
        time_ago: "3 days ago",
        avatars: ["K", "L"],
        additional_count: 31
      },
      %{
        id: 11,
        title: "Transitioning family meals to vegan",
        excerpt:
          "How to introduce vegan meals to a non-vegan family.",
        content:
          "How to introduce vegan meals to a non-vegan family.",
        reply_count: 22,
        time_ago: "6 days ago",
        avatars: ["M", "N"],
        additional_count: 20
      },
      %{
        id: 12,
        title: "Quick vegan lunch ideas for work",
        excerpt:
          "Go-to vegan lunches that are easy to prep and transport.",
        content:
          "Go-to vegan lunches that are easy to prep and transport.",
        reply_count: 29,
        time_ago: "2 days ago",
        avatars: ["O", "P"],
        additional_count: 27
      },
      %{
        id: 13,
        title: "Common mistakes new vegans make",
        excerpt:
          "What pitfalls should beginners avoid?",
        content:
          "What pitfalls should beginners avoid?",
        reply_count: 38,
        time_ago: "1 day ago",
        avatars: ["Q", "R", "S", "T"],
        additional_count: 34
      }
    ]
  end
  # ======================================================
  # SECTION 3 — Community Culture Topics (IDs 101–105)
  # ======================================================
  def get_building_culture_topics do
    [
      %{
        id: 101,
        title: "How to nurture robust discussions within the community",
        excerpt:
          "Encouraging engagement while keeping discussions focused, respectful, and productive.",
        content: """
        Great discussions are the backbone of a thriving community.
        At Skale, we aim to cultivate thoughtful debate, genuine curiosity, and a sense of belonging.

        Start by asking questions that invite reflection and collaboration.
        Share what you've learned, not just what you know — and be generous with encouragement.

        *"A good discussion doesn't end a topic — it opens new doors."*
        """,
        reply_count: 11,
        time_ago: "2 hours ago",
        avatars: ["AL", "MB", "SC"],
        additional_count: 3,
        replies: [
          %{
            id: 501,
            author: "Alex Lee",
            time_ago: "1 hour ago",
            content:
              "I love the emphasis on curiosity. It reminds me that debate isn't about winning — it's about exploring together.",
            likes: 6,
            replies: [
              %{
                id: 502,
                author: "Maria Gomez",
                time_ago: "45 min ago",
                content:
                  "Exactly! I've started ending my posts with open questions — it keeps threads alive longer and brings in new voices.",
                likes: 3,
                replies: []
              }
            ]
          }
        ]
      },
      %{
        id: 102,
        title: "Creating a welcoming tone for new members",
        excerpt:
          "Building an inclusive atmosphere starts with how we greet and guide new people.",
        content: """
        Every new member brings potential.
        A warm welcome can turn a hesitant visitor into an active contributor.

        Encourage introductions, ask where they'd like to grow, and pair them with friendly mentors.

        Consider creating a "Welcome Wednesday" thread where members share what inspired them to join.
        """,
        reply_count: 7,
        time_ago: "5 hours ago",
        avatars: ["DK", "NS"],
        additional_count: 2,
        replies: [
          %{
            id: 511,
            author: "Noah Singh",
            time_ago: "4 hours ago",
            content:
              "We tried welcome threads in my old community, and engagement skyrocketed. It really makes a difference.",
            likes: 5,
            replies: []
          }
        ]
      },
      %{
        id: 103,
        title: "Mentorship and organic leadership in online spaces",
        excerpt:
          "Leadership isn't a title — it's the consistency of positive influence and presence.",
        content: """
        The healthiest communities empower natural leaders — members who guide by example and empathy.

        Highlight users who turn heated debates into productive conversations.
        Recognize people who summarize discussions into next steps.

        Leadership isn't about control — it's about cultivating shared responsibility.
        """,
        reply_count: 5,
        time_ago: "1 day ago",
        avatars: ["LT", "PR", "AE"],
        additional_count: 1,
        replies: []
      },
      %{
        id: 104,
        title: "Keeping discussions positive without being fake",
        excerpt:
          "Constructive honesty is the secret to staying authentic while encouraging optimism.",
        content: """
        Positivity isn't pretending problems don't exist — it's choosing how we face them.

        When giving feedback, focus on the work, not the person.
        Humor, kindness, and a focus on solutions set a tone that invites creativity.
        """,
        reply_count: 9,
        time_ago: "2 days ago",
        avatars: ["AM", "JK", "LP"],
        additional_count: 3,
        replies: [
          %{
            id: 521,
            author: "Lena Park",
            time_ago: "1 day ago",
            content:
              "Love this! Constructive honesty helps everyone level up without burning out.",
            likes: 8,
            replies: []
          }
        ]
      },
      %{
        id: 105,
        title: "Expanding Skale's global culture and values",
        excerpt:
          "Exploring how our principles adapt across languages, cultures, and creative traditions.",
        content: """
        As Skale grows, our community reaches people from every corner of the world.

        The goal isn't to standardize culture — it's to connect meaningfully across differences.
        Share examples of kindness, creativity, and collaboration from your region.

        Global doesn't mean uniform — it means shared purpose with infinite expression.
        """,
        reply_count: 6,
        time_ago: "3 days ago",
        avatars: ["MS", "RP", "ZH"],
        additional_count: 3,
        replies: []
      }
    ]
  end

  # ======================================================
  # SECTION 4 — Notifications (COMMENTED OUT - using activities only)
  # ======================================================
  # def get_notifications() do
  #   [
  #     %{
  #       id: 1,
  #       user_name: "Alex Thompson",
  #       user_avatar: "https://i.pravatar.cc/150?img=4",
  #       message: "replied to your comment",
  #       group_name: nil,
  #       topic_title: nil,
  #       reply_excerpt: "This is super helpful — thanks for sharing!",
  #       time_ago: "30 min ago",
  #       read: false
  #     },
  #     %{
  #       id: 2,
  #       user_name: "Maria Garcia",
  #       user_avatar: "https://i.pravatar.cc/150?img=5",
  #       message: "liked your post",
  #       group_name: nil,
  #       topic_title: nil,
  #       reply_excerpt: nil,
  #       time_ago: "2 hours ago",
  #       read: false
  #     },
  #     %{
  #       id: 3,
  #       user_name: "David Wilson",
  #       user_avatar: "https://i.pravatar.cc/150?img=6",
  #       message: "started following you",
  #       group_name: nil,
  #       topic_title: nil,
  #       reply_excerpt: nil,
  #       time_ago: "1 day ago",
  #       read: true
  #     }
  #   ]
  # end

  # ======================================================
  # SECTION 5 — Recent Activities (advanced activity feed)
  # ======================================================
  def get_recent_activities() do
    [
      # ==================================================
      # UPDATED: Taylor Swift's reply to chocolate cake topic
      # ==================================================
      %{
        id: 1,
        type: :reply,
        user_name: "Taylor Swift",
        user_avatar: "https://i.pravatar.cc/150?img=10",
        group_name: "Vegan Baking",
        topic_id: 1,
        topic_title: "My perfect vegan chocolate cake recipe! 🎂",
        reply_excerpt: "Black salt is a game changer! Makes everything taste eggy.",
        target_content: "on your post 'My perfect vegan chocolate cake recipe! 🎂'",
        target_link: "/topic/1",
        likes_count: 4,
        replies_count: 0,
        time_ago: "1 day ago",
        is_new: true
      },

      # ==================================================
      # NEW LIKE
      # ==================================================
      %{
        id: 2,
        type: :like,
        user_name: "Mike Rodriguez",
        user_avatar: "https://i.pravatar.cc/150?img=2",
        group_name: "Vegan Cookbook Club",
        topic_id: 1,
        topic_title: "Meal Prep Ideas",
        reply_excerpt: nil,
        target_content: "liked your comment in 'Meal Prep Ideas'",
        target_link: "/topic/1",
        likes_count: 8,
        replies_count: 0,
        time_ago: "5 hours ago",
        is_new: false
      },

      # ==================================================
      # MENTION
      # ==================================================
      %{
        id: 3,
        type: :mention,
        user_name: "Jessica Kim",
        user_avatar: "https://i.pravatar.cc/150?img=3",
        group_name: "South Shore Eats",
        topic_id: 2,
        topic_title: "Farmers Market Finds",
        reply_excerpt: nil,
        target_content: "mentioned you in 'Farmers Market Finds'",
        target_link: "/topic/2",
        likes_count: 12,
        replies_count: 4,
        time_ago: "1 day ago",
        is_new: true
      },

      # ==================================================
      # NEW TOPIC CREATED
      # ==================================================
      %{
        id: 4,
        type: :new_topic,
        user_name: "Alex Johnson",
        user_avatar: "https://i.pravatar.cc/150?img=8",
        group_name: "Vegan Baking",
        topic_id: 15,
        topic_title: "New Vegan Brownies — Need Taste Testers!",
        reply_excerpt: nil,
        target_content: "posted a new topic",
        target_link: "/topic/15",
        likes_count: 0,
        replies_count: 0,
        time_ago: "3 hours ago",
        is_new: true
      },

      # ==================================================
      # NEW REPLY TO A REPLY (NESTED REPLY)
      # ==================================================
      %{
        id: 5,
        type: :nested_reply,
        user_name: "Chris Park",
        user_avatar: "https://i.pravatar.cc/150?img=9",
        group_name: "Vegan Baking",
        topic_id: 1,
        topic_title: "My perfect vegan chocolate cake recipe! 🎂",
        reply_parent_id: 22,
        reply_excerpt: "Black salt is a game changer — totally agree!",
        target_content:
          "replied to Alex Kim's reply in 'My perfect vegan chocolate cake recipe! 🎂'",
        target_link: "/topic/1#reply-22",
        likes_count: 2,
        replies_count: 0,
        time_ago: "6 hours ago",
        is_new: true
      }
    ]
  end
  # ======================================================
  # END OF MODULE
  # ======================================================
end
