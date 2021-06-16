class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @movies_array = Movie.order("vote_average DESC").where.not(poster_url: nil).first(50).sample(12)
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

    if @movie_picks.nil?
      redirect_to user_preferences_path
    end
    
    @genres = current_user.movie_picks.where(watch_list: true).map(&:movie).pluck(:genre).uniq


  end

  def user_preferences
    @movie = Movie.where.not(poster_url: nil).sample
    @movie = Movie.where.not(poster_url: nil).sample until current_user.movie_picks.where(movie: @movie).empty?
    @pick = MoviePick.create(user: current_user, movie: @movie, recommended: true)
    
  end

  def profile
    @movie_picks = current_user.movie_picks.where(watch_list: true, watched: false)
    @movie_count = current_user.movie_picks.where(watch_list: true).count
  end

end
