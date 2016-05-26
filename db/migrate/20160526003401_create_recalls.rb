class CreateRecalls < ActiveRecord::Migration[5.0]
  def change
    create_table :recalls do |t|
      t.string :number
      t.datetime :date
      t.text :description
      t.string :url
      t.string :title
      t.text :consumer_contact
      t.datetime :last_publish_date
      t.integer :number_of_units
      t.text :injuries
      t.text :hazards
      t.text :remedies
      t.text :retailers
      t.string :country
      t.integer :recallable_id
      t.string :recallable_type

      t.timestamps
    end
  end
end
