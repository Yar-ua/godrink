class CreatePhotos < ActiveRecord::Migration[5.0]
  def change
    create_table :photos do |t|
      t.string		:photos
      t.references	:event, index: true, foreign_key: true
      t.references	:user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
