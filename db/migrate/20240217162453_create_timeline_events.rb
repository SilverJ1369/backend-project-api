class CreateTimelineEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :timeline_events do |t|
      t.references :main_topic, foreign_key: true
      t.references :location, foreign_key: true
      t.text :details
      t.references :event_date, foreign_key: true
      t.boolean :is_graphic

      t.timestamps
    end
  end
end
