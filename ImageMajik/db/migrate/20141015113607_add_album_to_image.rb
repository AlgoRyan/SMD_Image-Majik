class AddAlbumToImage < ActiveRecord::Migration
  def change
    add_reference :images, :album, index: true
  end
end
