require 'json'
require 'open-uri'

movie_id = 1438
# poster_image_url = 'https://image.tmdb.org/t/p/w500'

puts '=' * 20
puts 'Creating movies'
puts '=' * 20

250.times do
  begin
    url = "https://api.themoviedb.org/3/movie/#{movie_id}?api_key=#{ENV['TMDB_KEY']}&language=pt-BR"
    open(url).status
  rescue OpenURI::HTTPError
    movie_id += 1
    url = "https://api.themoviedb.org/3/movie/#{movie_id}?api_key=#{ENV['TMDB_KEY']}&language=pt-BR"
    video_url = "https://api.themoviedb.org/3/movie/#{movie_id}/videos?api_key=#{ENV['TMDB_KEY']}&language=en-US"
    retry
  else
    url = "https://api.themoviedb.org/3/movie/#{movie_id}?api_key=#{ENV['TMDB_KEY']}&language=pt-BR"
    watch_url = "https://api.themoviedb.org/3/movie/#{movie_id}/watch/providers?api_key=#{ENV['TMDB_KEY']}&language=pt-BR"
    video_url = "https://api.themoviedb.org/3/movie/#{movie_id}/videos?api_key=#{ENV['TMDB_KEY']}&language=en-US"
    movie = JSON.parse(open(url).read)
    video = JSON.parse(open(video_url).read)['results']
    provider = JSON.parse(open(watch_url).read)['results']['BR']
    if video
      video_id = video[0] ? video[0]['key'] : ""
    else
      video_id = ''
    end
    if provider
      pr_name = provider['flatrate'] ? provider['flatrate'][0]['provider_name'] : ""
      pr_logo = provider['flatrate'] ? provider['flatrate'][0]['logo_path'] : ""
    else
      pr_name = ''
      pr_logo = ''
    end
    movie = Movie.create!(
      id_apimovie: movie['id'],
      title: movie['original_title'],
      overview: movie['overview'],
      poster_url: movie['poster_path'],
      vote_average: movie['vote_average'],
      release_year: movie['release_date'],
      runtime: movie['runtime'],
      genre: movie['genres'][0]['name'],
      trailer_url: video_id,
      language: movie['original_language']
    )

    puts "'#{movie.title}' created."
    movie_id += 1
  end
end

puts "#{Movie.count} movies created!"

puts 'Seed done!'
