class CreateGmapDots < ActiveRecord::Migration[5.0]
  def change
    create_table :gmap_dots do |t|
      t.float		:lat	  # широта lat
      t.float    :lon    # долгота lon
      t.text		:title  # заглавие для меню
      t.text		:html	  # описание метки

      # связать с user и event
      t.references	:user, index: true, foreign_key: true
      t.references	:event, index: true, foreign_key: true

      t.timestamps
    end
  end
end
