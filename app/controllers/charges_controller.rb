class ChargesController < ApplicationController

  def create
    @amount = params[:amount]

    customer = Stripe::Customer.create(
      email: current_user.email,
      card: params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      customer: customer.id,
      amount: @amount,
      description: "Blocipedia Membership - #{current_user.email}",
      currency: 'usd'
    )

    if current_user.update(role: 'premium')
      flash[:success] = "Thanks for all the money, #{current_user.email}!"
      redirect_to edit_user_registration_path
    else
      flash[:success] = "There was an error upgrading your account. Please contact support!"
      redirect_to edit_user_registration_path
    end

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_charge_path

  end


  # def new
  #   @stripe_btn_hash = {
  #     src: "https://checkout.stripe.com/checkout.js",
  #     class: 'stripe-button',
  #     id: 'pay-with-card',
  #     data: {
  #       key: "#{ Rails.configuration.stripe[:publishable_key] }",
  #       description: "Premium Membership - #{current_user.email}",
  #     amount: 15_00
  #     }
  #   }
  # end
end
