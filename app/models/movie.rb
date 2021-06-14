class Movie < ApplicationRecord
  has_many :movie_picks

  include PgSearch::Model

  pg_search_scope :search_by_title_and_overview,
    against: [ :title, :overview ],
    using: {
      tsearch: { prefix: true }
    }
end
