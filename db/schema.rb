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

ActiveRecord::Schema[8.0].define(version: 2025_05_02_142454) do
  create_table "reviews", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "surf_spot_id", null: false
    t.integer "rating"
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["surf_spot_id"], name: "index_reviews_on_surf_spot_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "sessions", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "user_agent"
    t.string "ip_address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_sessions_on_user_id"
  end

  create_table "spot_change_proposals", force: :cascade do |t|
    t.integer "surf_spot_id", null: false
    t.integer "user_id", null: false
    t.string "field_name", null: false
    t.text "old_value"
    t.text "new_value", null: false
    t.string "status", default: "pending"
    t.integer "upvotes", default: 0
    t.integer "downvotes", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["surf_spot_id"], name: "index_spot_change_proposals_on_surf_spot_id"
    t.index ["user_id"], name: "index_spot_change_proposals_on_user_id"
  end

  create_table "surf_spots", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.string "country"
    t.text "description"
    t.string "wave_type"
    t.string "break_type"
    t.string "optimal_swell_direction"
    t.string "optimal_wind_direction"
    t.string "best_tide"
    t.string "difficulty_level"
    t.string "crowd_level"
    t.string "localism_level"
    t.decimal "monthly_cost"
    t.decimal "rental_cost"
    t.decimal "lesson_cost"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "password_digest", null: false
    t.boolean "verified", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "reviews", "surf_spots"
  add_foreign_key "reviews", "users"
  add_foreign_key "sessions", "users"
  add_foreign_key "spot_change_proposals", "surf_spots"
  add_foreign_key "spot_change_proposals", "users"
end
