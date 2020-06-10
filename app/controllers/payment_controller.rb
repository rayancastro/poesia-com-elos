class PaymentController < ApplicationController
  def checkout
    subscription_plan = ENV['MONTHLY_STRIPE_PLAN']

    # Atualizado para utilização da PRICES API
    @session = Stripe::Checkout::Session.create(
      mode: 'subscription',
      payment_method_types: ['card'],
      line_items: [{
        price: subscription_plan,
        quantity: 1
      }],
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
