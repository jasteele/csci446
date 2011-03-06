class User < ActiveRecord::Base
  has_many :games #, :counter_cache => true
  belongs_to :role
  
  acts_as_authentic
  
  validates_presence_of :fname
  validates_presence_of :lname
  validates_length_of :username, :minimum => 6
  validates_length_of :password, :minimum => 6
  
  has_attached_file :photo,
					:url => '/assets/:class/:attachment/:id/:style/:filename'
  
  def role_symbols
	[role.name.downcase.to_sym]
  end
  
  def first_last
	"#{fname} #{lname}"
  end
  
end
