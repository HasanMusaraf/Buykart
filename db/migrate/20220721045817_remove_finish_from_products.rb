class RemoveFinishFromProducts < ActiveRecord::Migration[6.1]
  def change
    remove_column :products, :finish, :string
  end
end
