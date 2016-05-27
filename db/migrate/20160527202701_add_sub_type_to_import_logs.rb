class AddSubTypeToImportLogs < ActiveRecord::Migration[5.0]
  def change
    add_column :import_logs, :import_sub_type, :string
  end
end
