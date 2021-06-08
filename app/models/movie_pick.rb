class MoviePick < ApplicationRecord
  belongs_to :movies
  belongs_to :users
end
