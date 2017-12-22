require 'test_helper'

class PageTest < ActionDispatch::IntegrationTest
  test 'home page' do
    get pages_home_url
    assert_response :success
    # assert page.has_content?(@one.title)
    # assert page.has_content?(@two.title)
  end

  test 'root page' do
    get root_path
    assert_response :success
    # assert page.has_content?(@one.title)
    # assert page.has_content?(@two.title)
  end
end
