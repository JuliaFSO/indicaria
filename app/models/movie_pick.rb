class MoviePick < ApplicationRecord
  belongs_to :movie
  belongs_to :user
end
