class Image < ActiveRecord::Base
	
	belongs_to :album
	has_many :shares

	def user
		album.user
	end

	def share_with(giver, receiver)
		shares.create(image_id: self.id, 
									giver_id: giver.id, 
									receiver_id: receiver.id)
	end

	mount_uploader :picture, PictureUploader
end
