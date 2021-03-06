class Chef < ApplicationRecord
	before_save{self.email = email.downcase}
	validates :chefname, presence: {message:"le nom est obligatoire..."},
                    length: {minimum: 3, maximum: 25,message:"Un nom de chef doit avoir 3 caractères minimum et 25 au maximum..."}
    VALID_EMAIL_REGEX =  /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: {message:"l'email est obligatoire..."},
                    length: {minimum: 3, maximum: 25,message:"Un email doit avoir 3 caractères minimum et 25 au maximum..."},
                    format:{with: VALID_EMAIL_REGEX} , uniqueness: { case_sensitive: false }

    has_many :recettes, dependent: :destroy

    has_secure_password

    validates :password, presence: {message:"le mot de passe est obligatoire..."},
                    length: {minimum: 5, maximum: 25,message:"Un mot de passe doit avoir 5 caractères minimum et 25 au maximum..."}

    has_many :commentaires, dependent: :destroy
    has_many :messages, dependent: :destroy
    has_many :likes, dependent: :destroy
end
