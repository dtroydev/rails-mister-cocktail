class Ingredient < ApplicationRecord
  before_save :normalize_name, if: :will_save_change_to_name?

  has_many :doses
  validates :name, presence: true, uniqueness: { case_sensitive: false }

  private

  # Every word in name is capitalised
  # hyphens converted to spaces
  # apostrophies removed
  def normalize_name
    hyphens_to_spaces = name.tr('-', ' ')
    capitalised = hyphens_to_spaces.split.map(&:capitalize).join(' ')
    self.name = capitalised.delete("'")
  end
end
