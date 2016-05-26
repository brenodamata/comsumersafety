class CreateFoods < ActiveRecord::Migration[5.0]
  def change
    create_table :foods do |t|
      t.string :name
      t.string :firm
      t.string :description
      t.string :country
      t.string :city
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
