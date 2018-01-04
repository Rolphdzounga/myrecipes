require 'test_helper'

class RecetteTest < Capybara::Rails::TestCase
 def setup
    @valid = chefs :valid
    @un = chefs :one
    @deux = chefs :two
 end

  test 'le répertoire des chefs' do
  	@deux = chefs :two
    visit "/"
    assert page.has_link? "les chefs" 
    click_on "les chefs"
    assert_content "ghislain".titleize
    assert page.has_link? "ghislain".titleize
    assert page.has_link? "rodrigue".titleize
    # assert page.has_link? @valid.chefname.titleize
    # assert page.has_link? @un.chefname.titleize
    assert page.has_link?(@deux.chefname.titleize)
  end


end
