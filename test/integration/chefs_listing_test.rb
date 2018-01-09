require 'test_helper'

class RecetteTest < Capybara::Rails::TestCase
 def setup
    @un = chefs :one
    @deux = chefs :two
    @valid = chefs :valid
    @valid = init_user_admin @valid
    @valid.save  
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
    @un = chefs :one
    @deux = chefs :two
    @valid = chefs :valid
    @valid = init_user_admin @valid
    login_user @valid,'123456'
    visit chefs_path

    page.assert_selector('a.btn-danger', :count => 2)
    # first('.well').click_link('Supprimer mon compte')
  end

end
