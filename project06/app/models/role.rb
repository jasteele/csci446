class Role < ActiveRecord::Base
	has_many :users
	validates_presence_of :name
	validates_length_of :name, :minimum => 1
	
	
	cattr_reader :per_page
	@@per_page = 10
end
