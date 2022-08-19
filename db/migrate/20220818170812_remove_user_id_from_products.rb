# frozen_string_literal: true

class RemoveUserIdFromProducts < ActiveRecord::Migration[6.1]
  def change
    remove_column :products, :user_id, :int
  end
end
