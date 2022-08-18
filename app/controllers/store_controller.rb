# frozen_string_literal: true

class StoreController < ApplicationController
  def index; end

  def create
    @payment = Payment.new(cash_params)
    if @payment.save
      delete_cart = Cart.destroy_by(user_id: current_user.id)
      redirect_to root_path, notice: 'Order Successfully Placed'
    else
      render plain: 'failed'
    end
  end

  def cash_params
    params.require(:pay).permit(:name, :number, :pincode, :locality, :city, :state, :address, :card_number, :expiry,
                                :cvv, :card_holder, :number_of_items, :total_price, :product_title, :user_id)
  end

  def user_orders; end
end
