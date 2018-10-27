require 'rails_helper'

describe StripeService do
  it 'exists' do
    amount = 2000
    email = 'Bill@gmail.com'
    token = 'heiuhfewih987432kdf'
    city = 'denver'
    state = 'colorado'
    params = {
      stripeAmount: amount,
      stripeEmail: email,
      stripeToken: token,
      stripeCity: city,
      stripeState: state,
    }
    service = StripeService.new(params)

    expect(service).to be_a(StripeService)
  end
end
