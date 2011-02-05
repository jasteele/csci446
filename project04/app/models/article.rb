class Article < ActiveRecord::Base
	validates_presence_of :title, :author, :body
	validate :name_is_not_sally
	
	protected
		def name_is_not_sally
			errors.add(:author, "name can not be Sally") if author =~ /Sally|sally/
		end
end
