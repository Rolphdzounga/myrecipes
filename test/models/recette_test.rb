require 'test_helper'

class RecetteTest1 < ActiveSupport::TestCase
	def setup
		@recette = recettes(:valid)
		ressource = @recette
	end



	test "une recette valide" do
		assert @recette.valid?		
	end
    


	test "une recette sans name est invalide" do
		@recette.name = nil
		refute @recette.valid?,"mon site autorise des name de recette nul"
		assert_not_nil  @recette.errors[:name], "mon site autorise des name de recette nul"
		@recette.name = "a"*27
		refute @recette.valid?,"mon site autorise des name qui depasse 25 caractères"
	end

	test "une recette sans description est invalide" do
		@recette.description = nil
		refute @recette.valid?,"donc une recette sans description est valide"
		assert_not_nil  @recette.errors[:description], "l'attribut description nil est valide"
		@recette.description = "a"*401
		refute @recette.valid?,"donc une description de recette ayant plus de 400 caractères est tolérée"
	end
  private

  def test_valeur_nul(ressource, attribut)
	test "une recette sans #{attribut} est invalide" do
		ressource.attribut = nil
		refute ressource.valid?,"mon site autorise des #{attribut} de recette nul"
		assert_not_nil  ressource.errors[:attribut], "mon site autorise des #{attribut} de recette nul"
	end
  end
end
