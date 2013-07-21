class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :title
      t.string :author
      t.integer :rating
      t.text :text
      t.integer :user_id

      t.timestamps
    end
  end
end
