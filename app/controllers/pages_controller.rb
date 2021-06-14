class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @movies_array = []
    movies = Movie.all.sample(12)
    movies.each do |movie|
      if movie.poster_url != nil 
        @movies_array << movie
      end
    end
  end

  def dashboard
    @movie = Movie.where.not(poster_url: nil).sample
    @movie = Movie.where.not(poster_url: nil).sample until current_user.movie_picks.where(movie: @movie).empty?
    @movie_picks = current_user.movie_picks.where(watch_list: true, watched: false)
    if params[:query].present?
      @movie_picks = @movie_picks.select {|m| m.movie.genre == params[:query]}
      @movie_picks = @movie_picks.sample
    else
      @movie_picks = @movie_picks.sample
    end
  end

  def user_preferences
    @movie = Movie.where.not(poster_url: nil).sample
    @movie = Movie.where.not(poster_url: nil).sample until current_user.movie_picks.where(movie: @movie).empty?
    @pick = MoviePick.create(user: current_user, movie: @movie, recommended: true)
    
  end

  def profile
    @movie_picks = current_user.movie_picks.where(watch_list: true, watched: false)
  end

end
