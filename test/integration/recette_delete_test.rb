require "test_helper"

class RecetteDeleteTest < Capybara::Rails::TestCase
 def setup
    @one = recettes :one
    @two = recettes :two
 end


  test 'Accept Delete Recette' do
    visit recette_path(@one)

    click_on 'Supprimer cette recette'

    # assert_current_path "recettes/edit"
    page.assert_selector('div.alert-success')
    refute_content @one.name
    assert_content @two.name
   end


end