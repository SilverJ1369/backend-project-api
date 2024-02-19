class CreateEventDates < ActiveRecord::Migration[7.1]
  def change
    create_table :event_dates do |t|
      t.string :date_key
      t.integer :year
      t.integer :month
      t.integer :day
      t.boolean :is_ad
      t.string :modifier

      t.timestamps
    end
  end
end
