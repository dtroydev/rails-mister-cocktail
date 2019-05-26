class Cocktail < ApplicationRecord
  mount_uploader :photo, PhotoUploader

  has_many :doses, -> { order(created_at: :asc) }, dependent: :destroy
  has_many :ingredients, through: :doses
  has_many :reviews

  validates :name, presence: true, uniqueness: true
  # validates :image_url, presence: true
  validates :instructions, presence: true
end
