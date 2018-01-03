require 'test_helper'

class RecetteTest < Capybara::Rails::TestCase
 def setup
    @one = recettes :one
    @two = recettes :two
 end

  test 'page recettes index' do
    visit recettes_path
    refute_content "Aicha"
    assert page.has_link? @one.name 
    assert page.has_link? @two.name 
  end

  test "visite recette show page" do
  	visit recette_path(@one)
  	assert_content @one.name.capitalize
  	assert_content @one.description
  	assert_content @one.chef.chefname.capitalize
    assert page.has_link? "Mettre à jour cette recette"
    assert page.has_link? "Supprimer cette recette"
    assert page.has_link? "Retourner à la liste des recettes"
  end


  test 'writing a new Recette' do
    visit new_recette_path

    # click_on 'New Post'

    fill_in 'recette_name', with: 'Test Title'
    fill_in 'recette_description',  with: 'Test Body'

    click_on 'Create Recette'

    assert_current_path recette_path(Recette.last)
    assert_content "Test Title".capitalize
    assert page.has_content?('Test Body')
    assert_content "Etapes"
  end

end
