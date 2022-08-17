# frozen_string_literal: true

class RemoveCartIdFromLineItems < ActiveRecord::Migration[6.1]
  def change
    remove_column :line_items, :cart_id, :bigint
  end
end
