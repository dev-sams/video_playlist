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

ActiveRecord::Schema[7.1].define(version: 2024_07_10_195045) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "playlist_videos", force: :cascade do |t|
    t.bigint "playlist_id", null: false
    t.bigint "video_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["playlist_id"], name: "index_playlist_videos_on_playlist_id"
    t.index ["video_id"], name: "index_playlist_videos_on_video_id"
  end

  create_table "playlists", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_playlists_on_name"
  end

  create_table "videos", force: :cascade do |t|
    t.string "title"
    t.string "video_id"
    t.integer "views"
    t.string "thumbnail_url"
    t.text "description"
    t.integer "likes"
    t.integer "comments"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["title"], name: "index_videos_on_title"
    t.index ["video_id"], name: "index_videos_on_video_id", unique: true
  end

  add_foreign_key "playlist_videos", "playlists"
  add_foreign_key "playlist_videos", "videos"
end
