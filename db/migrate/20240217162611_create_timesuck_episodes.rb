class CreateTimesuckEpisodes < ActiveRecord::Migration[7.1]
  def change
    create_table :timesuck_episodes do |t|
      t.string :episode_number
      t.references :category, foreign_key: true
      t.references :main_topic, foreign_key: true

      t.timestamps
    end
  end
end
