# frozen_string_literal: true

class AddProductTitleToPayments < ActiveRecord::Migration[6.1]
  def change
    add_column :payments, :product_title, :string
  end
end
