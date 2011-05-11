class Peeps < ActiveRecord::Migration
  def self.up
    create_table :peeps do |t|
      t.string :first_name, :last_name, :email, :dietary_requirements, :twitter
      t.timestamps
    end
  end

  def self.down
    drop_table :peeps
  end
end
