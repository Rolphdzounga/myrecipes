class Recette < ApplicationRecord
	validates :description, presence: {message:"la description est obligatoire..."},
                    length: {minimum: 3, maximum: 400,message:"Une description doit avoir 7 caractères minimum et 400 au maximum..."}
	validates :name, presence: {message:"le nom est obligatoire..."},
                    length: {minimum: 3, maximum: 25,message:"Une description doit avoir 3 caractères minimum et 25 au maximum..."}
end
