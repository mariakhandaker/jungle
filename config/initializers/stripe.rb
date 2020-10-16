Rails.configuration.stripe = {
  :publishable_key => ENV['STRIPE_PUBLISHABLE_KEY'],
  :secret_key      => ENV['STRIPE_SECRET_KEY']
}

logger = Logger.new("my_log.txt")
logger.info(ENV['STRIPE_SECRET_KEY'])

Stripe.api_key = Rails.configuration.stripe[:secret_key]
