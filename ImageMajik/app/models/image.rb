class Image < ActiveRecord::Base

	belongs_to :album

	def user
		album.user
	end	
end
