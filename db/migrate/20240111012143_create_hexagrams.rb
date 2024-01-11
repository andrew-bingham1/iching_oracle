class CreateHexagrams < ActiveRecord::Migration[7.0]
  def change
    create_table :hexagrams do |t|
      t.string :title
      t.integer :number
      t.string :line
      t.string :summary
      t.string :judgment
      t.string :image
      t.string :uptrigram
      t.string :lotrigram

      t.timestamps
    end
  end
end
