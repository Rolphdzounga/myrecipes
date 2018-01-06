require 'test_helper'

class ChefTest < ActiveSupport::TestCase
	def setup
		@chef = chefs (:valid)
		@chef.password = "123456"
	end

	test "un chef valide" do
		assert @chef.valid?
	end

	test "un chef sans chefname est invalide" do
		@chef.chefname = nil
		refute @chef.valid?,"mon site autorise des chefname de chef nul"
		assert_not_nil  @chef.errors[:chefname], "mon site autorise des chefname de chef nul"
		@chef.chefname = "a"*27
		refute @chef.valid?,"mon site autorise des chefname qui depasse 25 caractères"
	end

	test "un chef sans email est invalide" do
		@chef.email = nil
		refute @chef.valid?,"mon site autorise des email de chef nul"
		assert_not_nil  @chef.errors[:email], "mon site autorise des email de chef nul"
		@chef.email = "a"*27
		refute @chef.valid?,"mon site autorise des email qui depasse 25 caractères"
	end

	test "rejete un email incorrect" do
		liste_invalide_email = %w[rolph@gmail rolph@gmail. rolph@gmail,com joe@gmail+foo.com]
		liste_invalide_email.each do |e|
			@chef.email = e
			refute @chef.valid?,"le site ne controle pas les emails invalide => #{e.inspect}"
			assert_not_nil @chef.errors[:email],"le site ne controle pas les emails invalide => #{e.inspect}"
		end
	end

	test "le mail est sensible à la casse" do
		chef_deux = @chef.dup
		chef_deux.email = @chef.email.upcase
		chef_deux.save
		refute chef_deux.valid?,"le site risque des doublon de mail different par la casse!!!"
	end

	test "le mail en base est en minuscule" do
		email_test = "JoHn@yahoo.fr"
		@chef.email = email_test
		@chef.save
		assert_equal email_test.downcase,@chef.reload.email, "le site ne transforme pas le mail en minuscule..."
	end

	test "le password est obligatoire" do
		@chef.password = @chef.password_confirmation = " "
		refute @chef.valid?
	end

	test "le password > 5 caractères" do
		@chef.password = @chef.password_confirmation = "a"*4
		refute @chef.valid?, "ne block pas les pwd < 5 c"
	end

	test "suppression du chef et ses recettes " do
		@chef.save
		@chef.recettes.create!(name:"recettes test", description:"description test")
		assert_difference 'Recette.count', -4 do
			@chef.destroy
		end

	end
end
