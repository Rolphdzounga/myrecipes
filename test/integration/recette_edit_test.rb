require "test_helper"

class RecetteEditTest < Capybara::Rails::TestCase
 def setup
    @one = recettes :one
    @valid = chefs :valid
    @valid = init_user_admin @valid
    @valid.save
 end


  test 'Reject invalid Recette update' do
    login_user @valid,'123456'
    visit edit_recette_path(@one)

    fill_in 'recette_name', with: ''
    fill_in 'recette_description',  with: ''

    click_on 'Update Recette'

    # assert_current_path "recettes/edit"

    page.assert_selector('h2.panel-title')
    page.assert_selector('div.panel-body')
  end

  test 'Accepte valid Recette update' do
    login_user @valid,'123456'
    visit edit_recette_path(@one)

    fill_in 'recette_name', with: 'beignets'
    fill_in 'recette_description',  with: 'eplucher la banane...'

    click_on 'Update Recette'

    # assert_current_path "recettes/edit"
    page.assert_selector('div.alert-success')
    assert_content 'beignets'.titleize
    assert_content 'eplucher la banane...'
   end


end