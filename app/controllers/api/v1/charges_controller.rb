class Api::V1::ChargesController < ApplicationController
  rescue_from Stripe::CardError, with: :catch_exception
  
  def new
  end

  def create
    render status: 200 if StripeService.new(stripe_params).connect
  end

  private

  def stripe_params
    params.permit(:stripeAmount, :stripeEmail, :stripeToken)
  end

  def catch_exception(exception)
    render json: exception.message, status: 422
  end
end
