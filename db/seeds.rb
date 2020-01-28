# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


class Seed

  def self.begin
    seed = Seed.new
    seed.generate_destinations
  end

  def generate_destinations
    20.times do |i|
      destination = Destination.create!(
        name: Faker::Movies::Hobbit.location,
        country: Faker::Address.country,
        city: Faker::Address.city
      )
      puts "Added #{i}: Name is #{destination.name}, city is '#{destination.city}', country is '#{destination.country}'."

      5.times do |r|
        review = Review.create!(
          review_title: Faker::Book.title,
          review_body: Faker::Restaurant.review,
          rating: Faker::Number.between(from: 1, to: 5),
          user_id: Faker::Number.between(from: 1, to: 99),
          destination_id: destination.id
        )
        puts "Added #{r}: Title is #{review.review_title}, review is '#{review.review_body}', rating is '#{review.rating}', user is '#{review.user_id}', destination id is '#{review.destination_id}'."
      end
    end
  end

end

Seed.begin
