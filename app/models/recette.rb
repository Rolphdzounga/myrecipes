class Recette < ApplicationRecord
	validates :description, presence: {message:"la description est obligatoire..."},
                    length: {minimum: 3, maximum: 2500,message:"Une description doit avoir 7 caractères minimum et 2500 au maximum..."}
	validates :name, presence: {message:"le nom est obligatoire..."},
                    length: {minimum: 3, maximum: 25,message:"le nom doit avoir 3 caractères minimum et 25 au maximum..."}
    belongs_to :chef
    validates :chef_id, presence: {message:"vous devez etre connecté pour créer une recette..."}

    default_scope -> {order(updated_at: :desc)}
end
