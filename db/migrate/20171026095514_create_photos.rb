class CreatePhotos < ActiveRecord::Migration[5.0]
  def change
    create_table :photos do |t|
      t.string :boy_name
      t.string :girl_name
      t.string :two_shot

      t.timestamps
    end
  end
end
