Rails.application.routes.draw do
  mount StripeEvent::Engine, at: '/stripe-webhooks'

  scope :checkout do
    get '/', to: 'payment#checkout', as: :checkout
    get '/success', to: 'payment#success', as: :checkout_success
    get '/error', to: 'payment#error', as: :checkout_error
  end
end
