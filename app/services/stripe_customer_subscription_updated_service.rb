class StripeCustomerSubscriptionUpdatedService
  # customer.subscription.updated
  # data.object is a subscription
  # Occurs whenever a subscription changes
  # (e.g., switching from one plan to another, or changing the status from trial to active).

  def call(event)
    case event.data.object.status
    when "incomplete"
      puts "Incomplete"
    when "incomplete_expired"
      puts "incomplete_expired"
    when "trialing"
      puts "trialing"
    when "active"
      puts "active"
    when "past_due"
      puts "past_due"
    when "canceled"
      puts "canceled"
    when "unpaid"
      puts "unpaid"
    else
      puts "else"
      puts event.data.object.status
    end
  end
end
