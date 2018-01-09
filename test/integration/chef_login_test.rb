require "test_helper"

class ChefLoginTest < Capybara::Rails::TestCase
 def setup
    @chef = chefs :valid
    @chef.password = '123456'
    @chef.save
 end


  test 'Rejete invalide login' do
    visit login_path
    fill_in 'chef_email', with: ''
    fill_in 'chef_password',  with: ''
    click_on 'Log in'
    assert page.assert_selector('div.alert-danger')
    visit root_path
    assert page.assert_no_selector('div.alert-danger')    
  end

  test 'Accepte valide login' do
    visit login_path
    fill_in 'chef_email', with: 'rolphfrancel@gmail.com'
    fill_in 'chef_password',  with: '123456'
    click_on 'Log in'
    assert page.assert_selector('div.alert-success')
    visit root_path
    assert page.assert_no_selector('div.alert-success')   
  end

end