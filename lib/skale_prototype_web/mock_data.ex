defmodule SkalePrototypeWeb.MockData do
  def get_topic_replies do
    %{
      id: 1,
      title: "Essential pantry items for new vegans",
      excerpt: "What are the must-have ingredients to stock your kitchen when starting a vegan diet?",
      reply_count: 24,
      time_ago: "3 days ago",
      avatars: ["C", "M", "J", "S"],
      additional_count: 16,
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
        title: "Essential pantry items for new vegans",
        excerpt: "What are the must-have ingredients to stock your kitchen when starting a vegan diet?",
        reply_count: 24,
        time_ago: "3 days ago",
        avatars: ["C", "M", "J", "S"],
        additional_count: 16
      },
      %{
        id: 2,
        title: "Easy vegan breakfast ideas",
        excerpt: "Share your quick and delicious vegan breakfast recipes that take less than 10 minutes to prepare.",
        reply_count: 42,
        time_ago: "1 day ago",
        avatars: ["A", "T", "R"],
        additional_count: 39
      },
      %{
        id: 3,
        title: "Dealing with cravings for cheese",
        excerpt: "How do you handle cravings for dairy products, especially cheese? Any good alternatives?",
        reply_count: 31,
        time_ago: "5 hours ago",
        avatars: ["L", "K"],
        additional_count: 29
      },
      %{
        id: 4,
        title: "Nutrition concerns for new vegans",
        excerpt: "What nutrients should beginners pay special attention to and how to ensure you're getting enough?",
        reply_count: 18,
        time_ago: "2 days ago",
        avatars: ["P", "D", "N"],
        additional_count: 15
      },
      %{
        id: 5,
        title: "Budget-friendly vegan meals",
        excerpt: "Share your most affordable vegan recipes that don't break the bank but still taste amazing.",
        reply_count: 27,
        time_ago: "4 days ago",
        avatars: ["E", "F", "G", "H"],
        additional_count: 23
      },
      %{
        id: 6,
        title: "Eating out as a new vegan",
        excerpt: "Tips for navigating restaurants and social situations when you're new to veganism.",
        reply_count: 15,
        time_ago: "1 week ago",
        avatars: ["I", "J"],
        additional_count: 13
      },
      %{
        id: 7,
        title: "Vegan protein sources beyond tofu",
        excerpt: "What are some creative and delicious ways to get enough protein without relying on tofu?",
        reply_count: 33,
        time_ago: "3 days ago",
        avatars: ["K", "L"],
        additional_count: 31
      },
      %{
        id: 8,
        title: "Transitioning family meals to vegan",
        excerpt: "How to gradually introduce vegan meals to a non-vegan family without resistance?",
        reply_count: 22,
        time_ago: "6 days ago",
        avatars: ["M", "N"],
        additional_count: 20
      },
      %{
        id: 9,
        title: "Quick vegan lunch ideas for work",
        excerpt: "What are your go-to vegan lunches that are easy to prep and transport to work?",
        reply_count: 29,
        time_ago: "2 days ago",
        avatars: ["O", "P"],
        additional_count: 27
      },
      %{
        id: 10,
        title: "Common mistakes new vegans make",
        excerpt: "What are some pitfalls to avoid when starting a vegan lifestyle?",
        reply_count: 38,
        time_ago: "1 day ago",
        avatars: ["Q", "R", "S", "T"],
        additional_count: 34
      }
    ]
  end
end
