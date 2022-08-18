# frozen_string_literal: true

class RemoveCardNumberFromPayments < ActiveRecord::Migration[6.1]
  def change
    remove_column :payments, :card_number, :int
  end
end
