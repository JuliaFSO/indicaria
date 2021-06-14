class MoviesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show, :return_to_back]

  def index
    if params[:query].present?
      @movies_array = Movie.search_by_title_and_overview(params[:query])
    else
      @movies_array = Movie.where.not(poster_url:nil)
    end
  end

  def show
    @movie = Movie.find(params[:id])
  end

end