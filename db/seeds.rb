# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


require 'csv'

file_path = File.join(Rails.root, "db", "imdb-data.csv")
data = CSV.parse(File.read(file_path), headers: true)

puts "Movie CSV import started ..."

data.each do |row|
  name = row['Title']
  description = row['Description']

  Movie.create!(
    name: name,
    description: description
  )
end

puts "Movie import is finished: (#{Movie.count})"
