class AddUserIdToRoastings < ActiveRecord::Migration
  def change
    add_column :roastings, :user_id, :integer
  end
end
