class AddFormReturnedToPeep < ActiveRecord::Migration
  def self.up
    add_column :peeps, :form_returned, :boolean, :default => false
  end

  def self.down
    remove_column :peeps, :form_returned
  end
end
