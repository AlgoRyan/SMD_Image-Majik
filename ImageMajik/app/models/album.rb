class Album < ActiveRecord::Base

	belongs_to :user
	has_many :image

	# mount_uploader :image, ImageUploader
	       
end
