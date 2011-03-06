class Role < ActiveRecord::Base
	has_many :users
	validates_presence_of :name
	validates_length_of :name, :minimum => 1
	
end
