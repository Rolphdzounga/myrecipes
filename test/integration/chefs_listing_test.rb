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

  test 'suppression des chefs' do
    visit chefs_path
    page.assert_selector('a.btn-danger', :count => 3)
    # first('.well').click_link('Supprimer mon compte')
  end

end
