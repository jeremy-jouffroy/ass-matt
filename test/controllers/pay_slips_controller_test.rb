require 'test_helper'

class PaySlipsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get pay_slips_show_url
    assert_response :success
  end

  test "should get new" do
    get pay_slips_new_url
    assert_response :success
  end

  test "should get edit" do
    get pay_slips_edit_url
    assert_response :success
  end

end
