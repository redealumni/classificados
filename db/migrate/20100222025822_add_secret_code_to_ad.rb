class AddSecretCodeToAd < ActiveRecord::Migration
  def self.up
    add_column :ads, :secret_code, :string
  end

  def self.down
    remove_column :ads, :secret_code
  end
end
