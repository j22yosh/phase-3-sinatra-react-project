puts "🌱 Seeding spices..."

puts "LOADING DEFAULT USERS"

5.times do 
    User.create(
        first_name: Faker::Name.first_name, 
        last_name: Faker::Name.last_name
    )
end
puts "LOADING DEFAULT TASKS"
10.times do
    Task.create(
        task_name: Faker::Hobby.activity,
        category_id: rand(1..5),
        user_id: rand(1..5)
    )
end

puts "LOADING DEFAULT CATEGORIES"
5.times do 
    Category.create(
        category_name: Faker::House.room
    )
end
# Seed your database here

puts "✅ Done seeding!"
