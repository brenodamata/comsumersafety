class CreateImportLogs < ActiveRecord::Migration[5.0]
  def change
    create_table :import_logs do |t|
      t.string :display_name
      t.float :size
      t.integer :records
      t.string :file
      t.datetime :date
      t.integer :type_id
      t.string :import_type
      t.boolean :processed, default: false

      t.timestamps
    end
  end
end
