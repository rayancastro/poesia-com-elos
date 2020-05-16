require 'test_helper'

class PaymentControllerTest < ActionDispatch::IntegrationTest
  test "should get checkout" do
    get payment_checkout_url
    assert_response :success
  end

end
