puts 'destroying...'
Dose.destroy_all
Cocktail.destroy_all
Ingredient.destroy_all

puts 'creating ingredients'

ingredients = [
  Ingredient.create!(name: "lemon"),
  Ingredient.create!(name: "ice"),
  Ingredient.create!(name: "mint leaves"),
  Ingredient.create!(name: "tequila"),
  Ingredient.create!(name: "oranges"),
  Ingredient.create!(name: "gin")
]

puts 'ingredients create!d'


require 'faker'

puts 'Creating 10 Cocktails...'
cocktail_names = []
10.times { cocktail_names << Faker::Company.name }

cocktail_names.uniq.each do |name|
  cocktail = Cocktail.create!(
    name: name
  )

  puts 'Creating Ingredients'
  cocktail_ingredients = []
  5.times { cocktail_ingredients << ingredients.sample }

  cocktail_ingredients.uniq.each do |ing|
    dose = Dose.create!(
      description: Faker::Dessert.topping,
      ingredient: ing,
      cocktail: cocktail
    )
  end
end


# 10.times do
#   restaurant = Restaurant.new(
#     name:    Faker::Company.name,
#     5.times do
#     ingredient: ingredients.sample,
#     category: ["chinese", "italian", "japanese", "french", "belgian"].sample,
#     phone_number: Faker::PhoneNumber
#   )
#   restaurant.save!
# end
# puts 'Finished!'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or create!d alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create!([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create!(name: 'Luke', movie: movies.first)
