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

ActiveRecord::Schema[7.0].define(version: 2022_07_17_231142) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "registrations", force: :cascade do |t|
    t.boolean "active", default: true
    t.bigint "user_id", null: false
    t.bigint "tournament_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tournament_id"], name: "index_registrations_on_tournament_id"
    t.index ["user_id"], name: "index_registrations_on_user_id"
  end

  create_table "tournaments", force: :cascade do |t|
    t.string "name"
    t.integer "game_mode"
    t.integer "rounds"
    t.integer "team_member"
    t.datetime "start_date"
    t.bigint "creator_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "time_zone"
    t.index ["creator_id"], name: "index_tournaments_on_creator_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "game_uid"
    t.string "codnickname"
    t.string "cellphone"
    t.string "time_zone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "country_code"
    t.string "provider", limit: 100, default: "", null: false
    t.string "uid", limit: 100, default: "", null: false
    t.string "avatar_url"
    t.string "full_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "registrations", "tournaments"
  add_foreign_key "registrations", "users"
  add_foreign_key "tournaments", "users", column: "creator_id"
end
