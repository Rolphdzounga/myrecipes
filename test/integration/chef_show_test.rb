require "test_helper"

class ChefShowTest < Capybara::Rails::TestCase
 def setup
    @chef = chefs :valid
 end


  test 'le profile du chef' do
    visit chef_path @chef
    assert page.has_link? "brochettes de poisson" 
    assert page.has_link? "riz rouge"
    assert page.has_link? "bouillon de poisson"
    assert_content @chef.chefname 
  end

end