class MoviesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show]

  def index
    @movies_array = []
    movies = Movie.all
    movies.each do |movie|
      if movie.poster_url != nil 
        @movies_array << movie
      end
    end
  end

  def show
    @movie = Movie.find(params[:id])
  end

end
