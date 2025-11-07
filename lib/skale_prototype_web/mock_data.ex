defmodule SkalePrototypeWeb.MockData do
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
        %{type: "image", url: "https://images.unsplash.com/photo-1578985545062-69928b1d9587?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1089&q=80"}
      ],
      replies: [
        %{
          id: 1,
          author: "Sarah Chen",
          avatar: "S",
          time_ago: "3 days ago",
          content: "As someone who's been vegan for 5 years, here are my absolute essentials: nutritional yeast (for cheesy flavor), canned coconut milk (for creamy sauces), various beans and lentils, quinoa, and lots of spices!",
          likes: 12,
          replies: []
        },
        %{
          id: 2,
          author: "Mike Rodriguez",
          avatar: "M",
          time_ago: "3 days ago",
          content: "Don't forget tahini! It's perfect for dressings, sauces, and even desserts. Also, chickpea flour is amazing for making vegan omelets.",
          likes: 8,
          replies: [
            %{
              id: 21,
              author: "Jamie Lee",
              avatar: "J",
              time_ago: "2 days ago",
              content: "Great point about tahini! I use it in my daily salad dressing.",
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
                  content: "Sure! Mix 1 cup chickpea flour with 1 cup water, add turmeric, black salt (for eggy flavor), and your favorite veggies. Cook like a regular omelet!",
                  likes: 7,
                  replies: []
                },
                %{
                  id: 222,
                  author: "Taylor Swift",
                  avatar: "T",
                  time_ago: "1 day ago",
                  content: "Black salt is a game changer! Makes everything taste eggy.",
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
          content: "From a nutritional standpoint, make sure you have fortified nutritional yeast for B12, flax seeds for omega-3s, and a variety of whole grains.",
          likes: 15,
          replies: []
        },
        %{
          id: 4,
          author: "Carlos Martinez",
          avatar: "C",
          time_ago: "2 days ago",
          content: "Cashews soaked overnight then blended make the best creamy sauces! Also, liquid smoke adds amazing flavor to tofu and tempeh.",
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
          %{type: "image", url: "https://images.unsplash.com/photo-1578985545062-69928b1d9587?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1089&q=80"}
        ]
      },
      %{
        id: 2,
        title: "YouTube tutorial: Vegan sourdough from scratch",
        excerpt: "I made a complete guide to vegan sourdough baking. From starter to finished loaf in 5 days...",
        content: "I made a complete guide to vegan sourdough baking. From starter to finished loaf in 5 days, this tutorial covers everything you need to know about creating the perfect vegan sourdough bread without any animal products. The key is maintaining a healthy starter and understanding the fermentation process.",
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
        excerpt: "Sharing some photos from this week's bake. Everything is 100% plant-based and delicious...",
        content: "Sharing some photos from this week's bake. Everything is 100% plant-based and delicious, including our new croissants made with vegan butter and our signature cinnamon rolls with cashew cream cheese frosting. We've been working on perfecting the lamination process for six months!",
        reply_count: 42,
        time_ago: "2 days ago",
        avatars: ["BD", "LC", "MP", "KW"],
        additional_count: 8,
        media: [
          %{type: "image", url: "https://images.unsplash.com/photo-1555507036-ab794f27d2e9?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80"},
          %{type: "image", url: "https://images.unsplash.com/photo-1568254183919-78a4f43a2877?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1169&q=80"}
        ]
      },
      %{
        id: 4,
        title: "Essential pantry items for new vegans",
        excerpt: "What are the must-have ingredients to stock your kitchen when starting a vegan diet?",
        content: "What are the must-have ingredients to stock your kitchen when starting a vegan diet? I'm putting together a shopping list and would love your input on what staples I should always have on hand for quick, easy, and nutritious meals.",
        reply_count: 24,
        time_ago: "3 days ago",
        avatars: ["C", "M", "J", "S"],
        additional_count: 16
      },
      %{
        id: 5,
        title: "Easy vegan breakfast ideas",
        excerpt: "Share your quick and delicious vegan breakfast recipes that take less than 10 minutes to prepare.",
        content: "Share your quick and delicious vegan breakfast recipes that take less than 10 minutes to prepare. I'm always rushing in the mornings but want to start my day with healthy, plant-based options that will keep me energized until lunch.",
        reply_count: 42,
        time_ago: "1 day ago",
        avatars: ["A", "T", "R"],
        additional_count: 39
      },
      %{
        id: 6,
        title: "Dealing with cravings for cheese",
        excerpt: "How do you handle cravings for dairy products, especially cheese? Any good alternatives?",
        content: "How do you handle cravings for dairy products, especially cheese? Any good alternatives? I've been vegan for two months but still find myself missing the taste and texture of cheese, particularly on pizza and in sandwiches.",
        reply_count: 31,
        time_ago: "5 hours ago",
        avatars: ["L", "K"],
        additional_count: 29
      },
      %{
        id: 7,
        title: "Nutrition concerns for new vegans",
        excerpt: "What nutrients should beginners pay special attention to and how to ensure you're getting enough?",
        content: "What nutrients should beginners pay special attention to and how to ensure you're getting enough? I want to make sure I'm meeting all my nutritional needs while transitioning to a fully plant-based diet.",
        reply_count: 18,
        time_ago: "2 days ago",
        avatars: ["P", "D", "N"],
        additional_count: 15
      },
      %{
        id: 8,
        title: "Budget-friendly vegan meals",
        excerpt: "Share your most affordable vegan recipes that don't break the bank but still taste amazing.",
        content: "Share your most affordable vegan recipes that don't break the bank but still taste amazing. As a college student, I need meals that are cost-effective but also satisfying and nutritious.",
        reply_count: 27,
        time_ago: "4 days ago",
        avatars: ["E", "F", "G", "H"],
        additional_count: 23
      },
      %{
        id: 9,
        title: "Eating out as a new vegan",
        excerpt: "Tips for navigating restaurants and social situations when you're new to veganism.",
        content: "Tips for navigating restaurants and social situations when you're new to veganism. I have several social events coming up and I'm worried about finding suitable options or dealing with questions from non-vegan friends and family.",
        reply_count: 15,
        time_ago: "1 week ago",
        avatars: ["I", "J"],
        additional_count: 13
      },
      %{
        id: 10,
        title: "Vegan protein sources beyond tofu",
        excerpt: "What are some creative and delicious ways to get enough protein without relying on tofu?",
        content: "What are some creative and delicious ways to get enough protein without relying on tofu? I'm not a huge fan of tofu's texture and would love to explore other plant-based protein options for my meals.",
        reply_count: 33,
        time_ago: "3 days ago",
        avatars: ["K", "L"],
        additional_count: 31
      },
      %{
        id: 11,
        title: "Transitioning family meals to vegan",
        excerpt: "How to gradually introduce vegan meals to a non-vegan family without resistance?",
        content: "How to gradually introduce vegan meals to a non-vegan family without resistance? My family is used to traditional meals with meat and dairy, and I'd like to start incorporating more plant-based options into our family dinners.",
        reply_count: 22,
        time_ago: "6 days ago",
        avatars: ["M", "N"],
        additional_count: 20
      },
      %{
        id: 12,
        title: "Quick vegan lunch ideas for work",
        excerpt: "What are your go-to vegan lunches that are easy to prep and transport to work?",
        content: "What are your go-to vegan lunches that are easy to prep and transport to work? I need ideas for lunches that can be made ahead, don't require reheating, and will keep me full throughout the afternoon.",
        reply_count: 29,
        time_ago: "2 days ago",
        avatars: ["O", "P"],
        additional_count: 27
      },
      %{
        id: 13,
        title: "Common mistakes new vegans make",
        excerpt: "What are some pitfalls to avoid when starting a vegan lifestyle?",
        content: "What are some pitfalls to avoid when starting a vegan lifestyle? I want to learn from others' experiences to make my transition smoother and more sustainable in the long run.",
        reply_count: 38,
        time_ago: "1 day ago",
        avatars: ["Q", "R", "S", "T"],
        additional_count: 34
      }
    ]
  end
end
