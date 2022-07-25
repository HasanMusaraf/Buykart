class RemoveConditionFromProducts < ActiveRecord::Migration[6.1]
  def change
    remove_column :products, :condition, :string
  end
end
