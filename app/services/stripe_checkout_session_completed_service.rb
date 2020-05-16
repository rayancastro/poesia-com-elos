class StripeCheckoutSessionCompletedService
  def call(event)
    stripe_customer = Stripe::Customer.retrieve(event.data.object.customer)
    order = Order.find_by(checkout_session_id: event.data.object.id)
    customer_email = stripe_customer.email
    order.email = customer_email
    order.status = "Pago"
    order.save
  rescue Exception => e
    puts e
    order.status = "Erro"
    order.error_message = e
    order.save
    raise Stripe::StripeError
  end
end
