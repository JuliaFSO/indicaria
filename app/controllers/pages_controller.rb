class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @movies = Movie.all.sample(12)
  end

  def dashboard
  end

  def user_preferences
  end

  def profile
    
  end

end
