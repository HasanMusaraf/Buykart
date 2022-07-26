# frozen_string_literal: true

class AddUserIdToProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :user_id, :integer
  end
end
