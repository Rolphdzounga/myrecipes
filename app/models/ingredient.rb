class Ingredient < ApplicationRecord
	validates :name,presence: true, length: {minimum: 3, maximum: 20}
	validates_uniqueness_of :name
	has_many :recette_ingredients
	has_many :recettes, through: :recette_ingredients

	default_scope -> {order(name: :asc)} #ORDRE D AFFICHAGE
end
