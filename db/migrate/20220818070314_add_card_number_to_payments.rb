# frozen_string_literal: true

class AddCardNumberToPayments < ActiveRecord::Migration[6.1]
  def change
    add_column :payments, :card_number, :bigint
  end
end
