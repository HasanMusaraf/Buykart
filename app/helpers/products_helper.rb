# frozen_string_literal: true

module ProductsHelper
  def product_seller(_product)
    user_signed_in? && current_user.email == 'musaraf@gmail.com'
  end
end
