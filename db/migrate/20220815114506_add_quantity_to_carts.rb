# frozen_string_literal: true

class AddQuantityToCarts < ActiveRecord::Migration[6.1]
  def change
    add_column :carts, :quantity, :integer, default: 1
  end
end
