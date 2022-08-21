# frozen_string_literal: true

class AddStatusToPayments < ActiveRecord::Migration[6.1]
  def change
    add_column :payments, :status, :boolean, default: false
  end
end
