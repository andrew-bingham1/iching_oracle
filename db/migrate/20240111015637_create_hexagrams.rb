# frozen_string_literal: true

class CreateHexagrams < ActiveRecord::Migration[7.0]
  def change
    create_table :hexagrams do |t|
      t.string :title
      t.string :oracle
      t.string :summary
      t.string :judgment
      t.string :judgment_sum
      t.string :image
      t.string :image_sum

      t.timestamps
    end
  end
end
