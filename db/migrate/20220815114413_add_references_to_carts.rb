# frozen_string_literal: true

class AddReferencesToCarts < ActiveRecord::Migration[6.1]
  def change
    add_reference :carts, :product, null: false, foreign_key: true
  end
end
