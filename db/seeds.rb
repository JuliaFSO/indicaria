require 'json'
require 'open-uri'

movie_id = 1
poster_image_url = 'https://image.tmdb.org/t/p/w500'

Movie.destroy_all
puts '=' * 20
puts 'Creating movies'
puts '=' * 20

100.times do
  begin
    url = "https://api.themoviedb.org/3/movie/#{movie_id}?api_key=#{ENV['TMDB_KEY']}&language=pt-BR"
    open(url).status
  rescue OpenURI::HTTPError
    movie_id += 1
    url = "https://api.themoviedb.org/3/movie/#{movie_id}?api_key=#{ENV['TMDB_KEY']}&language=pt-BR"
    retry
  else
    url = "https://api.themoviedb.org/3/movie/#{movie_id}?api_key=#{ENV['TMDB_KEY']}&language=pt-BR"
    watch_url = "https://api.themoviedb.org/3/movie/#{movie_id}/watch/providers?api_key=#{ENV['TMDB_KEY']}&language=pt-BR"
    movie = JSON.parse(open(url).read)
    provider = JSON.parse(open(watch_url).read)['results']['BR']
    if provider
      pr_name = provider['flatrate'] ? provider['flatrate'][0]['provider_name'] : ""
      pr_logo = provider['flatrate'] ? provider['flatrate'][0]['logo_path'] : ""
    else
      pr_name = ''
      pr_logo = ''
    end
    movie = Movie.create!(
      title: movie['title'],
      overview: movie['overview'],
      poster_url: "#{poster_image_url}#{movie['poster_path']}",
      vote_average: movie['vote_average'],
      release_year: movie['release_date'],
      runtime: movie['runtime'],
      genre: movie['genres'][0]['name'],
      language: movie['spoken_languages'][0]['name'],
      country: movie['production_countries'][0]['name'],
      id_apimovie: movie['id'],
      provider_name: pr_name,
      provider_logo: pr_logo
    )

    puts "'#{movie.title}' created."
    movie_id += 1
  end
end

puts "#{Movie.count} movies created!"

puts 'Seed done!'