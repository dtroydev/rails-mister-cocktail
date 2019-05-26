class Review < ApplicationRecord
  RATINGS = (0..5).to_a.freeze

  belongs_to :cocktail

  validates :content, presence: true
  validates :rating, presence: true, inclusion: { in: RATINGS }
end
