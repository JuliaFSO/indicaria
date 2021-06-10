class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @movies = Movie.all.sample(12)
  end

  def dashboard
  end

  def user_preferences
    @movies_array = []
    movies = Movie.all.sample(1)
    movies.each do |movie|
      if movie.poster_url != nil
        @movies_array << movie
      end
    end
  end

  def profile
    
  end

end
