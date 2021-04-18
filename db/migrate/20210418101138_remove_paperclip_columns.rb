class RemovePaperclipColumns < ActiveRecord::Migration[5.2]
  def up
    remove_column :roastings, :image_content_type
    remove_column :roastings, :image_file_name
    remove_column :roastings, :image_file_size
    remove_column :roastings, :image_updated_at
  end

  def down
    add_column :roastings, :image_content_type, :string
    add_column :roastings, :image_file_name, :sting
    add_column :roastings, :image_file_size, :integer
    add_column :roastings, :image_updated_at, :datetime
  end
end
