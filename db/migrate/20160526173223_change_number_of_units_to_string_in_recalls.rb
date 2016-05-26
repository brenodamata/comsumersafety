class ChangeNumberOfUnitsToStringInRecalls < ActiveRecord::Migration[5.0]
  def change
    change_column :recalls, :number_of_units, :string
  end
end
