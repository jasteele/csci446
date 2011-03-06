class AddUsersToGames < ActiveRecord::Migration
  def self.up
	add_column :games, :user_id, :integer
  end

  def self.down
  end
end
