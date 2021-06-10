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
  end

  def user_preferences
  end

  def profile
    
  end

end
