# frozen_string_literal: true

class AddNumberToPayments < ActiveRecord::Migration[6.1]
  def change
    add_column :payments, :number, :bigint
  end
end
