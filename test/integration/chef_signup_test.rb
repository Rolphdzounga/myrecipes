require "test_helper"

class ChefSignupTest < Capybara::Rails::TestCase
 def setup
    
 end


  test 'le chemin signup' do
    visit signup_path
  end

  test 'Rejete enregistrement invalide de chef' do
    visit signup_path

    fill_in 'chef_name', with: ''
    fill_in 'chef_email',  with: ''
    fill_in 'chef_password', with: ''
    fill_in 'password_confirmation',  with: ''
    click_on 'Créer mon compte'

     
    # assert (page.current_path.eql? "/signup")
    page.assert_selector('h2.panel-title')
    page.assert_selector('div.panel-body')
   end
  test 'Accepte enregistrement valide de chef' do
    visit signup_path

    fill_in 'chef_name', with: 'a'*5
    fill_in 'chef_email',  with: 'aiiiii@m.com'
    fill_in 'chef_password', with: '123456'
    fill_in 'password_confirmation',  with: '123456'
    click_on 'Créer mon compte'
    # assert_current_path "recettes/edit"
    page.assert_selector('div.alert-success')
    assert_content 'a'*5
   end


end