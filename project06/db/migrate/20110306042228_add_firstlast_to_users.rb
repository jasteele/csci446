class AddFirstlastToUsers < ActiveRecord::Migration
  def self.up
	add_column :users, :fname, :string
	add_column :users, :lname, :string
  end

  def self.down
	remove_column :users, :fname
	remove_column :users, :lname
  end
end
