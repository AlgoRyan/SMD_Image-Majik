class Album < ActiveRecord::Base
        
       mount_uploader :image, ImageUploader
        
end
