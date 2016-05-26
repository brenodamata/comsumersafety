class CreateDrugs < ActiveRecord::Migration[5.0]
  def change
    create_table :drugs do |t|
      t.string :name
      t.string :generic_name
      t.string :brand_name
      t.string :substance_name
      t.string :active_substance_name
      t.string :indication
      t.string :manufacturer
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
