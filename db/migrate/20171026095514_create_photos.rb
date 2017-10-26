class CreatePhotos < ActiveRecord::Migration[5.0]
  def change
    create_table :photos do |t|
      t.string :boy_img_name
      t.string :girl_img_name
      t.string :boy_name
      t.string :girl_name

      t.timestamps
    end
  end
end
