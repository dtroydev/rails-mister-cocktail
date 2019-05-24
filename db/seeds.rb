require 'open-uri'

COCKTAIL_DB_API = 'http://www.thecocktaildb.com/api/json/v1/1/'.freeze

INGREDIENTS = 'list.php?i=list'.freeze
COCKTAILS = 'filter.php?c=Cocktail'.freeze
COCKTAIL = 'lookup.php?i='.freeze

cocktails__cache = {}

define_method :cocktails_cache do
  cocktails__cache
end

def cdb_ingredients
  ingredients_json = URI.open("#{COCKTAIL_DB_API}#{INGREDIENTS}").read
  ingredients = JSON.parse(ingredients_json)['drinks']
  converted_ingredients = ingredients.map do |ingredient|
    { name: ingredient['strIngredient1'] }
  end
  converted_ingredients
end

def cdb_cocktail(cocktail_db_id)
  return cocktails_cache[cocktail_db_id] if cocktails_cache.key?(cocktail_db_id)

  cocktail_details_url = "#{COCKTAIL_DB_API}#{COCKTAIL}#{cocktail_db_id}"
  cocktail = JSON.parse(URI.open(cocktail_details_url).read)['drinks'][0]
  cocktails_cache[cocktail_db_id] = cocktail
  cocktail
end

# rubocop:disable Metrics/MethodLength
# rubocop:disable Metrics/AbcSize

def cdb_cocktails
  cocktails_json = URI.open("#{COCKTAIL_DB_API}#{COCKTAILS}").read
  cocktails = JSON.parse(cocktails_json)['drinks']
  total = cocktails.length
  counter = 0
  converted_cocktails = cocktails.map do |cocktail|
    puts "Cocktail Setup #{counter + 1} / #{total} done."
    counter += 1
    { name: cocktail['strDrink'],
      image_url: cocktail['strDrinkThumb'],
      instructions: cdb_cocktail(cocktail['idDrink'])['strInstructions'],
      cocktail_db_id: cocktail['idDrink'] }
  end
  converted_cocktails
end

puts 'Seeding Ingredients...'
Ingredient.create(cdb_ingredients)

puts 'Seeding Cocktails...'
Cocktail.create(cdb_cocktails)

def cdb_cocktail_doses(cocktail_db_id, cocktail_id)
  doses = []
  cocktail = cdb_cocktail(cocktail_db_id)
  15.times do |n|
    ingredient = cocktail["strIngredient#{n + 1}"]

    # ingredient can be nil
    next if !ingredient || ingredient.empty?

    measure = cocktail["strMeasure#{n + 1}"]
    description = measure.to_s.strip
    ingredient_lookup = Ingredient.where(name: ingredient).first
    # some cocktails have ingredients that are not in the ingredient list
    if ingredient_lookup.nil?
      new_ingredient = Ingredient.create(name: ingredient)
      ingredient_id = new_ingredient.id
    else
      ingredient_id = ingredient_lookup.id
    end

    dose = { description: description, ingredient_id: ingredient_id,
             cocktail_id: cocktail_id }

    doses << dose
  end
  doses
end

# rubocop:enable Metrics/MethodLength
# rubocop:enable Metrics/AbcSize

def cdb_doses
  counter = 0
  total = Cocktail.count
  Cocktail.all.each do |cocktail|
    Dose.create(cdb_cocktail_doses(cocktail.cocktail_db_id, cocktail.id))
    puts "Dose(s) for Cocktail #{counter + 1} / #{total} done."
    counter += 1
  end
end

puts 'Seeding Doses...'
cdb_doses
