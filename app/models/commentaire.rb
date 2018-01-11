class Commentaire < ApplicationRecord
  belongs_to :chef
  belongs_to :recette
  validates :description, presence: true, length: {minimum:2, maximum:400}
  default_scope -> {order(updated_at: :desc)} #ORDRE D AFFICHAGE

end
