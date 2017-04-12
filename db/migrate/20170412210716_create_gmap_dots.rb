class CreateGmapDots < ActiveRecord::Migration[5.0]
  def change
    create_table :gmap_dots do |t|
      t.string		:title		# имя точки на карте
      t.float		:latitude	# широта
      t.float		:longitude  # долгота

      t.references 	:event, index: true, foreign_key: true
      t.references 	:user, index: true, foreign_key: true

      t.timestamps
    end
  end
end
