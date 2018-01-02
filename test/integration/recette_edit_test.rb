require "test_helper"

class RecetteEditTest < Capybara::Rails::TestCase
 def setup
    @one = recettes :one
 end


  test 'Reject invalid Recette update' do
    visit edit_recette_path(@one)

    fill_in 'recette_name', with: ''
    fill_in 'recette_description',  with: ''

    click_on 'Update Recette'

    # assert_current_path "recettes/edit"

    page.assert_selector('h2.panel-title')
    page.assert_selector('div.panel-body')
  end

  test 'Accepte valid Recette update' do
    visit edit_recette_path(@one)

    fill_in 'recette_name', with: 'beignets'
    fill_in 'recette_description',  with: 'eplucher la banane...'

    click_on 'Update Recette'

    # assert_current_path "recettes/edit"
    page.assert_selector('div.alert-success')
    assert_content 'beignets'.capitalize
    assert_content 'eplucher la banane...'
   end


end