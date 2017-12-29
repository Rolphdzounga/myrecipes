require 'test_helper'

class RecetteTest < Capybara::Rails::TestCase
 def setup
    @one = recettes :one
    @two = recettes :two
 end

  test 'page recetts index' do
    visit recettes_path
    assert_content "Aicha"
    assert page.has_content?(@one.name)
    assert page.has_content?(@two.name)
  end
end
