# frozen_string_literal: true

class CreateWishes < ActiveRecord::Migration[6.1]
  def change
    create_table :wishes, &:timestamps
  end
end
