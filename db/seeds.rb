# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Idea.destroy_all
Review.destroy_all
User.destroy_all

PASSWORD = "123"

super_user = User.create(
    first_name: "Admin",
    last_name: "User",
    email: "admin@user.com",
    password: PASSWORD,
    admin?: true
)

10.times do
    first_name = Faker::Name.first_name
    last_name = Faker::Name.last_name
    User.create(
    first_name: first_name,
    last_name: last_name,
    email: "#{first_name}@#{last_name}.com",
    password: PASSWORD,
    admin?: false
    )
end

users = User.all





100.times do
    created_at = Faker::Date.backward(days: 365 * 5)

      q =  Idea.create(
        title: Faker::Hacker.say_something_smart,
        body: Faker::ChuckNorris.fact,
        created_at: created_at,
        updated_at: created_at,
        user: users.sample
    )

    if q.valid?
        rand(1..5).times do
            Review.create(body: Faker::Hacker.say_something_smart, idea: q, user: users.sample
            )
        end
    end
end

ideas = Idea.all
reviews = Review.all
puts Cowsay.say("Generated #{ideas.count} ideas", :frogs)

puts Cowsay.say("Generated #{reviews.count} reviews", :cow)

puts Cowsay.say("genereated #{users.count} users", :koala)