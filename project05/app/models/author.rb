class Author < ActiveRecord::Base
	validates_presence_of :name
	validate :name_is_not_sally
	has_many :articles
	has_attached_file :photo,
					  :url => '/assets/:class/:attachment/:id/:style/:filename'
	def to_s
		name
	end
	
	private
		def name_is_not_sally
			errors.add(:name, "name can not be Sally") if name =~ /\b[Ss]ally\b/
		end
end
