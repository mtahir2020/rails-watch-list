# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require "json"
require "open-uri"

puts "Cleaning database..."
Movie.destroy_all

url = "https://tmdb.lewagon.com/movie/top_rated"
movie_serialised = URI.open(url).read
movies = JSON.parse(movie_serialised)

movie_results = movies['results']

puts "creating movies"

movie_results.each do |movie|
  title = movie['title']
  overview = movie['overview']
  rating = movie['vote_average']
  poster_url = movie['poster_path']
  movie = Movie.new(title: title, overview: overview, rating: rating, poster_url: poster_url)
  movie.save
end

puts "movies done"
