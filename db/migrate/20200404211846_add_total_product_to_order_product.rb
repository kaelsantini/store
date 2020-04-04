class AddTotalProductToOrderProduct < ActiveRecord::Migration[6.0]
  def change
    add_column :order_products, :total_product, :decimal
  end
end
