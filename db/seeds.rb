# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
language_options = ['english', 'spanish', 'indian', 'japanese', 'chinese', 'french', 'italian']
gender_options = ['male', 'female']
adult_options = [true, true, false]

10000.times do
    User.create(
        language: language_options.sample,
        gender: gender_options.sample,
        adult: adult_options.sample
    )
end