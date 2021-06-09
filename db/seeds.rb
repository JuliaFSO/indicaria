require 'json'
require 'open-uri'

poster_image_url = 'https://image.tmdb.org/t/p/w500'

Movie.destroy_all
puts '=' * 20
puts 'Creating movies'
puts '=' * 20

10.times do |i|
  movies_url = "https://api.themoviedb.org/3/movie/#{i + 1}?api_key=#{ENV['TMDB_KEY']}&language=en-US"

  # movies = JSON.parse(open(movies_url).read)
  request = RestClient::Request.new({
	method: :get,
	url: movies_url,
  })

  puts request
  response = request.execute
  # response_body = JSON.parse(response.body)
  next if response.code.to_s.starts_with?('4')
    puts response
  # end

  # movies.each do |movie|
    # next unless Movie.where(title: movie['title']).empty?
    # next unless Movie.where(genre: movie['genres']).empty?
    # movie = Movie.create!(
    #   title: movie['title'],
    #   overview: movie['overview'],
    #   poster_url: "#{poster_image_url}#{movie['poster_path']}",
    #   vote_average: movie['vote_average'],
    #   release_year: movie['release_date'],
    #   runtime: movie['runtime'],
    #   # genre: movie['genres'][0],
    #   language: movie['language'],
    #   country: movie['country']
    # )

    # puts "'#{movie.title}' created."
  # puts movies
  # end
end

puts "#{Movie.count} movies created!"

puts 'Seed done!'