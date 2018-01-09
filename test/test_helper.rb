ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require "minitest/rails/capybara"


class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...

 #  def test_valeur_nul(ressource, attribut)
	# test "une recette sans #{attribut} est invalide" do
	# 	ressource.attribut = nil
	# 	refute ressource.valid?,"mon site autorise des #{attribut} de recette nul"
	# 	assert_not_nil  ressource.errors[:attribut], "mon site autorise des #{attribut} de recette nul"
	# end
 #  end

 	def login_user user,password
	 	visit login_path
	    fill_in 'chef_email', with: user.email
	    fill_in 'chef_password',  with: password
	    click_on 'Log in'		
 	end

 	def init_user_admin user
		# user = chefs :valid
	    user.toggle! :admin
	    user.password = '123456'
	    user.save
	    user
 	end

end
