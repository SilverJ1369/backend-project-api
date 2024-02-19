class CreateMainTopics < ActiveRecord::Migration[7.1]
  def change
    create_table :main_topics do |t|
      t.string :name
      t.references :location, foreign_key: true
      t.references :category, foreign_key: true
      t.references :start_date, foreign_key: { to_table: :event_dates }
      t.references :end_date, foreign_key: { to_table: :event_dates }

      t.timestamps
    end
  end
end
