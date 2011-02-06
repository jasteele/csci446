class AddDefaultToTimesEdited < ActiveRecord::Migration
  def self.up
	change_column :articles, :times_edited, :integer, :default => 0
  end

  def self.down
  end
end
