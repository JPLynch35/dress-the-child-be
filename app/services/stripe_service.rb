 class StripeService

  def initialize(params)
    @amount = params[:stripeAmount]
    @email  = params[:stripeEmail]
    @token  = params[:stripeToken]
  end

  def connect
    customer = create_customer
    charge_customer(customer)
  end

  private
  attr_reader :amount, :email, :token

  def create_customer
    Stripe::Customer.create(
      email: @email, 
      source: @token
    )
  end

  def charge_customer(customer)
    Stripe::Charge.create(
      customer: customer.id,
      amount: @amount,
      description: 'Dress-The-Child Donor',
      currency: 'usd'
    )
  end
end
