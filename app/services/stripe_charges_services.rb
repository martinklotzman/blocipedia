class StripeChargesServices
  DEFAULT_CURRENCY = 'usd'.freeze

  def initialize(params, user)
    @stripe_email = params[:stripeEmail]
    @stripe_token = params[:stripeToken]
    @user = user
  end

  def call
    create_charge(create_customer)
    @user.update_attribute(:role, 1)
  end

  private

  attr_accessor :stripeEmail, :stripeToken

  def create_customer
    customer = Stripe::Customer.create(
      email: @stripe_email,
      card: @stripe_token
    )
  end

  def create_charge(customer)
    Stripe::Charge.create(
      customer: customer.id, # Note -- this is NOT the user_id in your app
      amount: 15_00,
      description: "BigMoney Membership - #{@stripe_email}",
      currency: DEFAULT_CURRENCY
    )
  end
end
