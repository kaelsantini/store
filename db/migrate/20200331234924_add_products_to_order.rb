class AddProductsToOrder < ActiveRecord::Migration[6.0]
  def change
    create_join_table :orders, :products
  end
end
