10.times do
  User.create(name: Faker::Name.name, email: Faker::Internet.email, password: "password")
end

# 25.times do
  # rand_date=Date.new(2016,rand(4..12), rand(1..28))
  # Event.create!(creator_id: User.all.sample.id, start_date: rand_date, end_date: rand_date + 7, max_people: rand(1..10), theme: Faker::Hipster.word, name: Faker::Hipster.word)
rand_date=Date.new(2016,rand(4..12), rand(1..28))
Event.create(creator_id: 1, start_date: rand_date, end_date: rand_date + 7, max_people: 5, theme: "Chili-Cookoff!", name: "All Chili All Week Long!")
rand_date=Date.new(2016,rand(4..12), rand(1..28))
Event.create(creator_id: 1, start_date: rand_date, end_date: rand_date + 7, max_people: 3, theme: "Vegetarian", name: "Cabbage is for closers")
rand_date=Date.new(2016,rand(4..12), rand(1..28))
Event.create(creator_id: 1, start_date: rand_date, end_date: rand_date + 7, max_people: 5, theme: "Meatitarian", name: "If it bleeds, we feeds")
rand_date=Date.new(2016,rand(4..12), rand(1..28))
Event.create(creator_id: 1, start_date: rand_date, end_date: rand_date + 7, max_people: 5, theme: "Salads", name: "Potato, bean, chicken...whatever")
rand_date=Date.new(2016,rand(4..12), rand(1..28))
Event.create(creator_id: 1, start_date: rand_date, end_date: rand_date + 7, max_people: 5, theme: "Family Recipes", name: "Like grandma used to make")
rand_date=Date.new(2016,rand(4..12), rand(1..28))
Event.create(creator_id: 1, start_date: rand_date, end_date: rand_date + 7, max_people: 5, theme: "Butter", name: "French cuisine (not fries Larry!!")
rand_date=Date.new(2016,rand(4..12), rand(1..28))
Event.create(creator_id: 1, start_date: rand_date, end_date: rand_date + 7, max_people: 6, theme: "Baked Goods", name: "Lets all get fat together")
rand_date=Date.new(2016,rand(4..12), rand(1..28))
Event.create(creator_id: 1, start_date: rand_date, end_date: rand_date + 7, max_people: 5, theme: "Corn", name: "A kernel of truth")
rand_date=Date.new(2016,rand(4..12), rand(1..28))
Event.create(creator_id: 1, start_date: rand_date, end_date: rand_date + 7, max_people: 5, theme: "Horse Meat", name: "SeaBiscuit and Gravy")
rand_date=Date.new(2016,rand(4..12), rand(1..28))
Event.create(creator_id: 1, start_date: rand_date, end_date: rand_date + 7, max_people: 15, theme: "Soylent Green", name: "Feed us!!")

day_array = ["not sure", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday"]

Meal.create(name: "Pork Noodle Chili", cook_id: 1, event_id: 1, day: day_array.sample, description: "This chili is traditionally really spicy but I'll keep it edible for you soft-mouthed types. Definitely my favorite chili of all time!")
Meal.create(name: "Ten Bean Chili", cook_id: 2, event_id: 1, day: day_array.sample, description: "Step aside three-bean chili! This chili will have you makin stink music all night long. Plus its tasty.")
Meal.create(name: "Generic Chili", cook_id: 3, event_id: 1, day: day_array.sample, description: "There's really nothing special about this chili. Its got ground beef and beans with a tomato base.")

Meal.create(name: "Eggplant Muffaletta", cook_id: 4, event_id: 2, day: day_array.sample, description: "Honestly- just bringing these because its funny to say out loud")
Meal.create(name: "Vegetarian Lasagna", cook_id: 5, event_id: 2, day: day_array.sample, description: "If you like italian food, you'll love this lasagna. I put mushrooms in to substitute for the beef.")
Meal.create(name: "Homemade Hummus", cook_id: 6, event_id: 2, day: day_array.sample, description: "I'll bring pita bread also for dipping")

Meal.create(name: "Lamb Meatloaf", cook_id: 7, event_id: 3, day: day_array.sample, description: "The only thing tastier than a sheep is its baby, in the form of a loaf.")
Meal.create(name: "Pork Meatballs", cook_id: 8, event_id: 3, day: day_array.sample, description: "Spiced pork in a meaty gravy. Trust.")
Meal.create(name: "Meatful Meatcakes", cook_id: 9, event_id: 3, day: day_array.sample, description: "I grind up ten different animals and compress all the meat into a patty and deep fry it. They're amazing.")

Meal.create(name: "Chicken Salad", cook_id: 1, event_id: 4, day: day_array.sample, description: "I put granny smith apples into the standard recipe for a little sweet zing!")
Meal.create(name: "German Potato Salad", cook_id: 4, event_id: 4, day: day_array.sample, description: "Regular potato salad has so much mayonaise. This recipe uses vinegar instead- healthier and tastes amazing!")
Meal.create(name: "Kale Salad", cook_id: 7, event_id: 4, day: day_array.sample, description: "This salad is gross but so good for you. You'll get used to eating Kale.")

Meal.create(name: "Granny's Famous Meatloaf", cook_id: 2, event_id: 5, day: day_array.sample, description: "My granny (RIP) used to make this when I visited her on holidays. Topped with applesauce.")
Meal.create(name: "Cousin Jim's Moonshine", cook_id: 5, event_id: 5, day: day_array.sample, description: "I know this isn't technically food, but this moonshine is BANGIN.")
Meal.create(name: "Mom's Spaghetti", cook_id: 8, event_id: 5, day: day_array.sample, description: "You only get one shot, do not miss your chance to try Mom's Spaghetti.")

Meal.create(name: "Chocolate Chip Cookies", cook_id: 3, event_id: 7, day: day_array.sample, description: "I make them super soft and gooey! Every cookie has like 2 tablespoons of shortening in it. Disgusting, but you can't argue with results.")
Meal.create(name: "Banana Loaf", cook_id: 7, event_id: 7, day: day_array.sample, description: "Simple banana bread. But I don't put any walnuts in because walnuts are gross.")
Meal.create(name: "Cherry Pie", cook_id: 10, event_id: 7, day: day_array.sample, description: "This pie will make you do a backflip its so damn delicious. Just don't land on the pie.")

# end

# 10.times do
#   Comment.create(commenter_id: User.all.sample.id, event_id: Event.all.sample.id, body: Faker::Hipster.sentence)
# end

# 40.times do
#   days = ["Mon", "Tues", "Weds", "Thurs", "Fri"]
#   Meal.create(name: Faker::Hipster.word, cook_id: User.all.sample.id, event_id: Event.all.sample.id, description: Faker::Hipster.sentence,day: days.sample)
# end
