# frozen_string_literal: true

class AddRefsToWishes < ActiveRecord::Migration[6.1]
  def change
    add_reference :wishes, :users, foreign_key: true
    add_reference :wishes, :products, foreign_key: true
  end
end
