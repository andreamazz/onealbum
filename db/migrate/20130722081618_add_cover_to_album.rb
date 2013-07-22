class AddCoverToAlbum < ActiveRecord::Migration
  def change
    add_column :albums, :deezer_id, :integer
    add_column :albums, :cover, :string
  end
end
