# frozen_string_literal: true

class RemoveModelFromProducts < ActiveRecord::Migration[6.1]
  def change
    remove_column :products, :model, :string
  end
end
