class Game < ActiveRecord::Base
belongs_to :user
validates_presence_of :title

cattr_reader :per_page
@@per_page = 10

end
