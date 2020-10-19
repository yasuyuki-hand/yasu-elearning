require 'test_helper'

class Admin::Categories::WordsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_categories_words_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_categories_words_show_url
    assert_response :success
  end

  test "should get new" do
    get admin_categories_words_new_url
    assert_response :success
  end

  test "should get edit" do
    get admin_categories_words_edit_url
    assert_response :success
  end

end
