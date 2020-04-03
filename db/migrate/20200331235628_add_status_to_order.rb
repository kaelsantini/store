class AddStatusToOrder < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :completed, :boolean
  end
end
