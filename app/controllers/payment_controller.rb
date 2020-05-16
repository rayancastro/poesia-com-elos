class PaymentController < ApplicationController
  def checkout
    subscription_plan = ENV['MONTHLY_STRIPE_PLAN']

    @session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      subscription_data: {
        items: [
          {
            plan: subscription_plan
          }
        ]
      },
      success_url: checkout_success_url,
      cancel_url: checkout_error_url,
    )
    order = Order.create(checkout_session_id: @session.id, status: "Pendente")
  end

  def success
  end

  def error
  end
end
