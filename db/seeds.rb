# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do |j|
  u = User.create(login: "login#{j + 1}")

  20.times do |i|
    p = Post.create(
      title: "#{i + 1} post",
      body: "#{i + 1} body",
      user_id: u.id,
      ip: "127.0.0.#{i % 50}"
    )

    next unless i < 15

    Rating.create(
      user_id: u.id,
      post_id: p.id,
      value: rand(1..5)
    )
  end
end
