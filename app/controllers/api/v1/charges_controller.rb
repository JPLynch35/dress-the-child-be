class Api::V1::ChargesController < ApplicationController
  def new
  end
  
  def create
    @amount = [params[:stripeAmount]]
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
      render status: 200
    end
    puts "amount:" + params[:stripeAmount]
    puts "email:" + params[:stripeEmail]
    puts "token:" + params[:stripeToken]
  rescue Stripe::CardError => e
    render json: e.message
  end
end
