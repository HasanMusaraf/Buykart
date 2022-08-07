module ProductsHelper

    def product_seller(product)

        user_signed_in? && current_user.email == "musaraf@gmail.com" 

    end





end
