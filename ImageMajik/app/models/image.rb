class Image < ActiveRecord::Base
	
	belongs_to :album

	def user
		album.user
	end	

	mount_uploader :picture, PictureUploader 
end
