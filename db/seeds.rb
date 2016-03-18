10.times do
  User.create(name: Faker::Name.name, email: Faker::Internet.email, password: "password")
end

25.times do
  rand_date=Date.new(2016,rand(1..12), rand(1..28))
  Event.create!(creator_id: User.all.sample.id, start_date: rand_date, end_date: rand_date + 7, max_people: rand(1..10), theme: Faker::Hipster.word, name: Faker::Hipster.word)
end

10.times do
  Comment.create(commenter_id: User.all.sample.id, event_id: Event.all.sample.id, body: Faker::Hipster.sentence)
end

40.times do
  days = ["Mon", "Tues", "Weds", "Thurs", "Fri"]
  Meal.create(name: Faker::Hipster.word, cook_id: User.all.sample.id, event_id: Event.all.sample.id, description: Faker::Hipster.sentence,day: days.sample)
end
