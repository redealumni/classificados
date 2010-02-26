class AddKindToAd < ActiveRecord::Migration
  def self.up
    add_column :ads, :kind, :string, :default => "sell"
  end

  def self.down
    remove_column :ads, :kind
  end
end
