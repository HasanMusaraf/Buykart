# frozen_string_literal: true

class CreatePayments < ActiveRecord::Migration[6.1]
  def change
    create_table :payments do |t|
      t.string :name
      t.integer :number
      t.integer :pincode
      t.string :locality
      t.string :city
      t.string :state
      t.string :address
      t.integer :card_number
      t.string :expiry
      t.integer :cvv
      t.string :card_holder
      t.integer :number_of_items
      t.integer :total_price

      t.timestamps
    end
  end
end
