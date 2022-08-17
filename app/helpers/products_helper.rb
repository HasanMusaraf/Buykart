# frozen_string_literal: true

module ProductsHelper
  def product_seller(_product)
    user_signed_in? && current_user.admin
  end

  def add_only_logged
    user_signed_in?
  end
end
