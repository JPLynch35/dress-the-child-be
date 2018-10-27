 class StripeService
  def initialize(params)
    @amount = params[:stripeAmount]
    @email  = params[:stripeEmail]
    @token  = params[:stripeToken]
    @city   = params[:stripeCity]
    @state  = params[:stripeState]
  end

  def connect
    customer = create_customer
    charge_customer(customer)
  end

  private
  attr_reader :amount, :email, :token, :city, :state

  def create_customer
    Stripe::Customer.create(
      email: email, 
      source: token
    )
  end

  def charge_customer(customer)
    Stripe::Charge.create(
      customer: customer.id,
      amount: amount,
      description: 'Dress-The-Child Donor',
      currency: 'usd',
      address_city: city,
      address_state: state
    )
  end
end
