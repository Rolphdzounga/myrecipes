class Like < ApplicationRecord
  belongs_to :chef
  belongs_to :recette

  validates_uniqueness_of :chef, scope: :recette
end
