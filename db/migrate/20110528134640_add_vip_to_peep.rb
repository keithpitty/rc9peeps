class AddVipToPeep < ActiveRecord::Migration
  def self.up
    add_column :peeps, :vip, :boolean, :default => false
  end

  def self.down
    remove_column :peeps, :vip
  end
end
