class AddCategoryToAd < ActiveRecord::Migration
  def self.up
    add_column :ads, :category_id, :integer
  end

  def self.down
    remove_column :ads, :category_id
  end
end
