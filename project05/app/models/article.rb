class Article < ActiveRecord::Base
	validates_presence_of :title, :author, :body
	validate :name_is_not_sally
	
	belongs_to :author
	
	protected
		def name_is_not_sally
			errors.add(:author, "name can not be Sally") if author =~ /\b[Ss]ally\b/
		end
end
