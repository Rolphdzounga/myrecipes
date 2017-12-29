require "test_helper"

class CanAccessHomeTest < Capybara::Rails::TestCase
  test "sanity" do
    visit root_path
  #   assert_content page, "Hello World"
  #   refute_content page, "Goodbye All!"
  	  assert page.has_content?("Heading")
  end
end
