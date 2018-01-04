require "test_helper"

class ChefShowTest < Capybara::Rails::TestCase
 def setup
    @chef = chefs :valid
 end


  test 'Rejete edition de données invalides' do
    visit chef_path @chef
    click_on 'Mettre à jour mon compte'
    fill_in 'chef_name', with: ''
    fill_in 'password_confirmation',  with: '123456'
    click_on 'Mettre à jour mon profile'
    assert page.assert_selector('h2.panel-title')
    assert page.assert_selector('div.panel-body')

  end

  test 'Accepte edition de données invalides' do
    visit chef_path @chef
    click_on 'Mettre à jour mon compte'
    fill_in 'chef_name', with: 'Bill Gate'
    fill_in 'chef_password',  with: '123456'
    fill_in 'password_confirmation',  with: '123456'
    click_on 'Mettre à jour mon profile'
	assert page.assert_selector('div.alert-success')
	assert_content 'Bill Gate'
  end

end