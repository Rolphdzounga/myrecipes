class RecetteIngredient < ApplicationRecord
  belongs_to :recette
  belongs_to :ingredient
end
