class MoviePicksController < ApplicationController
  before_action :set_movie_pick, only: [:refuse, :watch_list, :watch_movie]

  def refuse
    @movie_pick.update(refused: true)
    redirect_to user_preferences_path
  end

  def watch_movie
    @movie_pick.update(watched: true)
    redirect_to user_preferences_path
  end
  
  def watch_list
    @movie_pick.update(watch_list: true)
    redirect_to user_preferences_path
  end

  private

  def set_movie_pick
    @movie_pick = MoviePick.find(params[:id])
  end
end
