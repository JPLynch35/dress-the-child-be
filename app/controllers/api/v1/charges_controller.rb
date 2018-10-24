class Api::V1::ChargesController < ApplicationController
  def new
  end
  
  def create
    @amount = 500
    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )
    if Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Rails Stripe customer',
      :currency    => 'usd'
      )
    end
    render json: {
      stripeAmount: params[:stripeAmount],
      stripeEmail: params[:stripeEmail],
      stripeToken: params[:stripeToken]
    }.to_json
  rescue Stripe::CardError => e
    render json: e.message
  end
end
