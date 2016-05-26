class CreateMedicalDevices < ActiveRecord::Migration[5.0]
  def change
    create_table :medical_devices do |t|
      t.string :name
      t.string :brand
      t.string :specialty
      t.string :manufacturer
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
