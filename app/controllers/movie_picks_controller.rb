class MoviePicksController < ApplicationController
  before_action :set_movie_pick, only: [:refuse, :add_to_watch_list, :remove_from_watch_list, :watch_movie, :add_to_profile]

  def refuse
    @movie_pick.update(refused: true)
    redirect_to user_preferences_path
  end

  def watch_movie
    @movie_pick.update(watched: true)
    redirect_to user_preferences_path
  end
  
  def watch_list
    @movie_pick.update(watch_list: !@movie_pick.watch_list)
  end

  def add_to_watch_list
    watch_list
    redirect_to user_preferences_path
  end

  def remove_from_watch_list
    watch_list
    redirect_to profile_path
  end

  def add_to_profile
    @movie_pick.update(watch_list: true)
    redirect_to profile_path
  end

  private

  def set_movie_pick
    @movie_pick = MoviePick.find(params[:id])
  end
end
