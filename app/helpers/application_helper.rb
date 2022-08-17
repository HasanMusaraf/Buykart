# frozen_string_literal: true

module ApplicationHelper
  def cart_count_over_one
    @has_cart = Cart.where(user_id: current_user)

    "<span>#{@has_cart.count} </span>".html_safe
  end

  def cart_count
    @has_cart = Cart.where(user_id: current_user)

    @has_cart.count
  end
end
