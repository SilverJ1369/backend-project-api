# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_02_17_163406) do
  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "event_dates", force: :cascade do |t|
    t.string "date_key"
    t.integer "year"
    t.integer "month"
    t.integer "day"
    t.boolean "is_ad"
    t.string "modifier"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "locations", force: :cascade do |t|
    t.string "location_key"
    t.string "country"
    t.string "state"
    t.string "city"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "main_topics", force: :cascade do |t|
    t.string "name"
    t.integer "location_id"
    t.integer "category_id"
    t.integer "start_date_id"
    t.integer "end_date_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_main_topics_on_category_id"
    t.index ["end_date_id"], name: "index_main_topics_on_end_date_id"
    t.index ["location_id"], name: "index_main_topics_on_location_id"
    t.index ["start_date_id"], name: "index_main_topics_on_start_date_id"
  end

  create_table "timeline_events", force: :cascade do |t|
    t.integer "main_topic_id"
    t.integer "location_id"
    t.text "details"
    t.integer "event_date_id"
    t.boolean "is_graphic"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_date_id"], name: "index_timeline_events_on_event_date_id"
    t.index ["location_id"], name: "index_timeline_events_on_location_id"
    t.index ["main_topic_id"], name: "index_timeline_events_on_main_topic_id"
  end

  create_table "timesuck_episodes", force: :cascade do |t|
    t.string "episode_number"
    t.integer "category_id"
    t.integer "main_topic_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_timesuck_episodes_on_category_id"
    t.index ["main_topic_id"], name: "index_timesuck_episodes_on_main_topic_id"
  end

  add_foreign_key "main_topics", "categories"
  add_foreign_key "main_topics", "event_dates", column: "end_date_id"
  add_foreign_key "main_topics", "event_dates", column: "start_date_id"
  add_foreign_key "main_topics", "locations"
  add_foreign_key "timeline_events", "event_dates"
  add_foreign_key "timeline_events", "locations"
  add_foreign_key "timeline_events", "main_topics"
  add_foreign_key "timesuck_episodes", "categories"
  add_foreign_key "timesuck_episodes", "main_topics"
end
