class MoviesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show]

  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
  end
end
