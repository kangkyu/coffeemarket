class AddRoastingIdToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :roasting_id, :integer
  end
end
