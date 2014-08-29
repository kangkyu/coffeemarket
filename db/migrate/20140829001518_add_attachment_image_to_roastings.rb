class AddAttachmentImageToRoastings < ActiveRecord::Migration
  def self.up
    change_table :roastings do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :roastings, :image
  end
end
