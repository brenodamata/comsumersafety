class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :manufacturer
      t.string :manufacturer_countries
      t.string :description
      t.string :model
      t.string :type
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
