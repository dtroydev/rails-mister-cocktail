class Dose < ApplicationRecord
  VARIETIES = ['blended',
               'crushed',
               'frozen',
               'grated',
               'juice of',
               'large',
               'twist of'].freeze

  MEASURES = ['can(s)',
              'cl(s)',
              'cube(s)',
              'cup(s)',
              'dash(es)',
              'drop(s)',
              'glass(es)',
              'handful(s)',
              'jigger(s)',
              'large sprig(s)',
              'litre(s)',
              'measure(s)',
              'ml(s)',
              'oz(s)',
              'part(s)',
              'pinch(es)',
              'shot(s)',
              'slice(s)',
              'splash(es)',
              'sprig(s)',
              'strip(s)',
              'table spoon(s)',
              'tea spoon(s)',
              'wedge(s)'].freeze

  belongs_to :cocktail
  belongs_to :ingredient

  validates :description, presence: true
  validates :ingredient, presence: true, uniqueness: { scope: :cocktail }
  validates :cocktail, presence: true

  validates :quantity, presence: true
  validates :measure, inclusion: { in: MEASURES }
  validates :variety, inclusion: { in: VARIETIES }, allow_blank: true

  # rubocop:disable Metrics/MethodLength
  # rubocop:disable Metrics/AbcSize
  # rubocop:disable Metrics/PerceivedComplexity
  def description
    description = super
    if description.blank?
      if quantity.blank? || measure.blank?
        description
      else
        measure = self.measure.dup
        if quantity == '1'
          measure.slice!(measure.index('(')..-1)
        else
          measure.gsub!(/[()]/, '')
        end
        "#{quantity} #{measure} #{variety}".strip
      end
    else
      description
    end
  end
  # rubocop:enable Metrics/MethodLength
  # rubocop:enable Metrics/AbcSize
  # rubocop:enable Metrics/PerceivedComplexity
end
