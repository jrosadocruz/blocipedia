class ChargesController < ApplicationController

  def create
    @amount = params[:amount]

    if current_user.customer_id.nil?
      customer = Stripe::Customer.create(
        email: current_user.email,
        card: params[:stripeToken]
      )
      current_user.customer_id = customer.id
    end

    Stripe::Charge.create(
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

  def downgrade
    # customer = Stripe::Customer.retrieve(current_user.customer_id)
    # customer.delete
    current_user.update_attributes(role: 'standard', customer_id: nil)
    current_user.make_wikis_public
    redirect_to edit_user_registration_path
  end

end
