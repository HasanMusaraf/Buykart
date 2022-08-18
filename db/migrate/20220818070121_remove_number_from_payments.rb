# frozen_string_literal: true

class RemoveNumberFromPayments < ActiveRecord::Migration[6.1]
  def change
    remove_column :payments, :number, :int
  end
end
